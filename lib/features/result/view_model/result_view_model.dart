import 'package:collection/collection.dart';
import 'package:school_enhancer_app/common/service/user_data_service.dart';
import 'package:school_enhancer_app/core/dependency_injection/injection.dart';
import 'package:school_enhancer_app/core/model/base_view_model.dart';
import 'package:school_enhancer_app/data/api_service/result/model/result_response_model.dart';
import 'package:school_enhancer_app/data/repository/result_repository.dart';

class ResultViewModel extends BaseViewModel {
  final UserDataService? _userDataService = injection<UserDataService>();
  final IResultRepository? _resultRepository = injection<IResultRepository>();

  List<ResultResponseModel>? _responseModel;
  List<ResultResponseModel>? get resultResponseModel => _responseModel;

  List<TermModel> get terms {
    var groupByData = groupBy(
      _responseModel!,
      (ResultResponseModel obj) => obj.examType,
    );

    return groupByData.entries.map((e) {
      return TermModel(examType: e.key, subjects: e.value);
    }).toList();
  }

  TermModel get minimumPercentTerm {
    return terms.reduce((value, element) =>
        (value.obtainedPercent < element.obtainedPercent) ? value : element);
  }

  TermModel get maximumPercentTerm {
    return terms.reduce((value, element) =>
        (value.obtainedPercent > element.obtainedPercent) ? value : element);
  }

  double get averagePercent {
    double total = 0;
    terms.forEach((element) {
      total += element.obtainedPercent;
    });
    return total / (terms.length);
  }

  getResult() async {
    setFailure(null);
    //loading true
    setLoading(true);
    //get profile

    final studentId = "ca330fb2-de66-43f6-92a5-b2d519b6b365";
    final response = await _resultRepository!.getResult(studentId);

    //error
    //success
    response.fold(
      (l) {
        setFailure(l.failure);
      },
      (r) {
        _responseModel = r;
        notifyListeners();
      },
    );
    //loading false
    setLoading(false);
  }
}

class TermModel {
  final String? examType;
  final List<ResultResponseModel>? subjects;

  TermModel({this.examType, this.subjects});

  double get totalObtainedMarks {
    double total = 0;
    subjects!.forEach((element) {
      total += element.obtainedMark!;
    });
    return total;
  }

  double get totalFullMarks {
    double total = 0;
    subjects!.forEach((element) {
      total += element.subject!.fullMark!;
    });
    return total;
  }

  double get obtainedPercent => totalObtainedMarks / totalFullMarks * 100;
}
