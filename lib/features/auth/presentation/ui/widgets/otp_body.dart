import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tamtam/core/theme/app_colors.dart';
import 'package:tamtam/features/auth/logic/auth_cubit.dart';
import 'package:tamtam/features/auth/logic/auth_state.dart';
import 'package:tamtam/features/auth/presentation/ui/widgets/otp_action_button.dart';
import 'package:tamtam/features/auth/presentation/ui/widgets/otp_header.dart';
import 'package:tamtam/features/auth/presentation/ui/widgets/otp_input_fields.dart';
import 'package:tamtam/features/auth/presentation/ui/widgets/otp_resend_text.dart';

class OtpBody extends StatefulWidget {
  const OtpBody({super.key});

  @override
  State<OtpBody> createState() => _OtpBodyState();
}

class _OtpBodyState extends State<OtpBody> {
  String _currentCode = '';

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuthCubit>();

    return Container(
      width: double.infinity,
      height: double.infinity,
      color: AppColors.white,
      child: SafeArea(
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 48.h),
                const OtpHeader(),
                SizedBox(height: 40.h),
                OtpInputFields(
                  onChanged: (code) {
                    _currentCode = code;
                    cubit.updateOtp(code);
                  },
                  onCompleted: (code) {
                    _currentCode = code;
                    cubit.updateOtp(code);
                  },
                ),
                SizedBox(height: 50.h),
                BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    return OtpActionButton(
                      isLoading: state is OtpLoading,
                      onPressed: () {
                        cubit.verifyOtp(_currentCode);
                      },
                    );
                  },
                ),
                SizedBox(height: 22.h),
                OtpResendText(
                  onResend: () {
                    cubit.resendOtp();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Verification code resent!'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                ),
                SizedBox(height: 24.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
