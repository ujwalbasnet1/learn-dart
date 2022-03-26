import 'package:school_enhancer_app/common/ui/ui_helper.dart';
import 'package:school_enhancer_app/common/ui/widgets/filled_button.dart';
import 'package:school_enhancer_app/features/login/view_model/login_view_model.dart';
import 'package:stacked/stacked.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
        viewModelBuilder: () => LoginViewModel(),
        disposeViewModel: true,
        builder: (context, model, child) {
          return Scaffold(
            body: ListView(
              padding: lPadding,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                Column(
                  children: [
                    Image.asset(
                      'assets/images/logo.png',
                      height: 72,
                      fit: BoxFit.fitHeight,
                    ),
                    lHeightSpan,
                    _textFieldSection(context, model),
                    lHeightSpan,
                    Text(
                      'Forgot your password?',
                      style: Theme.of(context).textTheme.subtitle2!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context)
                              .textTheme
                              .subtitle2!
                              .color!
                              .withOpacity(0.5)),
                    ),
                    mHeightSpan,
                    Container(
                      width: 148,
                      height: 44,
                      child: KFilledButton(
                        child: (model.isLoading)
                            ? Center(child: CircularProgressIndicator())
                            : Text("Continue"),
                        onPressed: () {
                          model.login();
                        },
                      ),
                    ),
                    mHeightSpan,
                  ],
                ),
              ],
            ),
          );
        });
  }

  Widget _textFieldSection(BuildContext context, LoginViewModel model) =>
      Center(
        child: Column(
          children: [
            TextFormField(
              onChanged: model.onPhoneChanged,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.phone),
                hintText: "Phone Number",
                contentPadding: lYPadding,
              ),
              keyboardType: TextInputType.phone,
            ),
            mHeightSpan,
            TextFormField(
              onChanged: model.onPasswordChanged,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
                hintText: "Password",
                contentPadding: lYPadding,
              ),
              obscureText: true,
            ),
          ],
        ),
      );
}
