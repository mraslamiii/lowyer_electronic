import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'colors/colors.dart';
import 'dimens/dimens.dart';
import 'dimens/font_size.dart';

class AppThemes {
  static ThemeData lightThemeMobile(BuildContext context) {
    var theme = Theme.of(context);
    return ThemeData(
      typography: Typography.material2018(),
      primaryColor: AppColors.primaryColor,
      errorColor: AppColors.errorColor,
      indicatorColor: AppColors.primaryColor,
      fontFamily: 'Vazir',
      dividerColor: AppColors.dividerColor,
      shadowColor: AppColors.shadowColor,
      brightness: Brightness.light,
      cardColor: AppColors.cardColor,
      backgroundColor: AppColors.backgroundColor,
      scaffoldBackgroundColor: AppColors.backgroundColor,
      dialogBackgroundColor: AppColors.surfaceColor,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      toggleableActiveColor: AppColors.primaryColor,
      applyElevationOverlayColor: false,
      textTheme: TextTheme(
        headline5:
            TextStyle(fontWeight: FontWeight.w700, fontSize: headline5TextSize),
        headline6:
            TextStyle(fontWeight: FontWeight.w700, fontSize: headline6TextSize),
        subtitle1: TextStyle(
          fontSize: subtitle1TextSize,
          fontWeight: FontWeight.w500,
        ),
        subtitle2: TextStyle(
          fontSize: subtitle2TextSize,
          fontWeight: FontWeight.w600),
        bodyText1:
            TextStyle(fontWeight: FontWeight.w500, fontSize: body1TextSize),
      ),
      appBarTheme: AppBarTheme(
          centerTitle: true,
          color: AppColors.backgroundColor,
          elevation: 0.6,
          shadowColor: AppColors.primaryColor.withOpacity(0.2),
          titleTextStyle: TextStyle(
              color: AppColors.textBlackColor,
              fontFamily: 'Vazir',
              fontSize: subTitleSize,
              fontWeight: FontWeight.w600),
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: AppColors.backgroundColor,
              statusBarBrightness: Brightness.dark,
              statusBarIconBrightness: Brightness.dark,
              systemNavigationBarColor: AppColors.backgroundColor,
              systemNavigationBarIconBrightness: Brightness.dark)),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        elevation: 8.0,
        selectedItemColor: AppColors.primaryColor,
        backgroundColor: AppColors.backgroundColor,
        type: BottomNavigationBarType.fixed,
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: AppColors.surfaceColor,
      ),
      dialogTheme: DialogTheme(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(largeSize)),
        backgroundColor: AppColors.backgroundColor,
      ),
      hintColor: AppColors.hintColor,
      inputDecorationTheme: InputDecorationTheme(
        fillColor: AppColors.formFieldColor,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(smallRadius),
          borderSide: const BorderSide(color: AppColors.borderColor, width: 0),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(xxSmallRadius),
          borderSide: const BorderSide(color: AppColors.borderColor, width: 0),
        ),
        // hintStyle:
        // GoogleFonts.poppins(
        //     color: AppColors.hintColor,
        //     fontSize: 13,
        //     fontWeight: FontWeight.w400,
        //     letterSpacing: 0.25),
        contentPadding: EdgeInsets.symmetric(
            vertical: standardSize, horizontal: standardSize),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(smallRadius),
          borderSide: const BorderSide(color: AppColors.primaryColor, width: 1),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(smallRadius),
          borderSide: const BorderSide(color: AppColors.borderColor, width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(smallRadius),
          borderSide: const BorderSide(color: AppColors.errorColor, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(smallRadius),
          borderSide: const BorderSide(color: AppColors.errorColor, width: 1),
        ),
      ),
      dividerTheme: DividerThemeData(
          color: AppColors.dividerColor,
          thickness: 0.3,
          endIndent: 0,
          indent: 0,
          space: 0),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              shadowColor: AppColors.primaryColor.withOpacity(0.50),
              elevation: 0,
              padding: EdgeInsets.symmetric(
                  vertical: standardSize, horizontal: standardSize),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(smallRadius),
              ))),
      buttonTheme: ButtonThemeData(
          padding: EdgeInsets.all(smallSize),
          buttonColor: AppColors.primaryColor,
          disabledColor: AppColors.primaryColor.withOpacity(0.2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(mediumRadius),
          )),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(mediumRadius),
      ))),
      progressIndicatorTheme:
          const ProgressIndicatorThemeData(color: AppColors.primaryColor),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: AppColors.primaryColor),
      checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateProperty.all(AppColors.primaryColor)),
      radioTheme: RadioThemeData(
          fillColor: MaterialStateProperty.all(AppColors.primaryColor)),
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
              foregroundColor: AppColors.primaryColor, shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(mediumRadius),
              ))),
      iconTheme:
          IconThemeData(color: AppColors.iconColor, size: iconSizeMedium),
      sliderTheme: const SliderThemeData(
        activeTrackColor: AppColors.primaryColor,
      ),
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.all(AppColors.primaryColor),
      ),
      tabBarTheme: TabBarTheme(
        labelColor: AppColors.primaryColor,
        indicatorSize: TabBarIndicatorSize.label,
        unselectedLabelStyle: theme.textTheme.subtitle1,
        labelStyle: theme.textTheme.subtitle1,
      ),
      toggleButtonsTheme: ToggleButtonsThemeData(
        fillColor: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(mediumRadius),
        borderColor: AppColors.borderColor,
      ),
      textSelectionTheme:
          const TextSelectionThemeData(cursorColor: AppColors.primaryColor),
      colorScheme:
          ColorScheme.fromSwatch().copyWith(secondary: AppColors.accentColor),
    );
  }
}
