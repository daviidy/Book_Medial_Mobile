part of step_two_view;

class _StepTwoMobile extends StatelessWidget {
  final StepTwoViewModel viewModel;

  _StepTwoMobile(this.viewModel);

  Widget _form(context) {
    return Form(
      key: viewModel.formKey,
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 2),
          child: PinCodeTextField(
            appContext: context,
            pastedTextStyle: TextStyle(
              color: Colors.green.shade600,
              fontWeight: FontWeight.bold,
            ),
            length: 4,
            obscureText: false,
            //obscuringCharacter: '*',
            // obscuringWidget: FlutterLogo(
            //   size: 24,
            // ),
            blinkWhenObscuring: true,
            animationType: AnimationType.fade,
            // validator: (v) {
            //   if (v!.length < 3) {
            //     return "I'm from validator";
            //   } else {
            //     return null;
            //   }
            // },
            pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(10),
                fieldHeight: 50,
                fieldWidth: AppTheme.fullWidth(context)/6,
                activeFillColor: Colors.white,
                inactiveColor: Color(0xFFDFDBDB),
                inactiveFillColor: Color(0xffF6F6F6),
                selectedFillColor: Color(0xffF6F6F6),
                selectedColor: LightColor.primary),
            cursorColor: Colors.black,
            animationDuration: Duration(milliseconds: 300),
            enableActiveFill: true,
            //errorAnimationController: errorController,
            //controller: textEditingController,
            keyboardType: TextInputType.number,
            // boxShadows: [
            //   BoxShadow(
            //     offset: Offset(0, 1),
            //     color: Colors.black12,
            //     blurRadius: 10,
            //   )
            // ],
            onCompleted: viewModel.onCompleted,
            // onTap: () {
            //   print("Pressed");
            // },
            onChanged: viewModel.onChanged,
            beforeTextPaste: (text) {
              print("Allowing to paste $text");
              //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
              //but you can show anything you want here, like your pop up saying wrong paste format or etc
              return false;
            },
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              ShareWidget.headerStyle2(context: context),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(left: 20),
                child: AutoSizeText(
                  "Vérification du code",
                  maxLines: 1,
                  maxFontSize: 24,
                  minFontSize: 10,
                  style: AppTheme.globalFont(
                      TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(left: 20),
                child: AutoSizeText(
                  "Entrez le code de 4 chiffres reçu par mail",
                  maxLines: 1,
                  maxFontSize: 24,
                  minFontSize: 10,
                  style: AppTheme.globalFont(
                      TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                ),
              ),
              SizedBox(
                height: AppTheme.fullHeight(context) / 5,
              ),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: _form(context)),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 14),
                child: TextButton(
                  onPressed: () => viewModel.send(context),
                  child: ShareWidget.button(
                      context: context,
                      backgoundColor: LightColor.primary,
                      borderWidth: 0.0,
                      title: "Vérifier",
                      textColor: Colors.white,
                      height: 50,
                      margin: 0),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 18),
                child: TextButton(
                  onPressed: () => null,
                  child: AutoSizeText(
                    "Renvoyer le code ?",
                    maxLines: 1,
                    maxFontSize: 24,
                    minFontSize: 10,
                    style: AppTheme.globalFont(TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: LightColor.primary)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
