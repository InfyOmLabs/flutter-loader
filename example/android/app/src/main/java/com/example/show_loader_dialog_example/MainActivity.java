package com.example.show_loader_dialog_example;

import android.app.ProgressDialog;

import androidx.annotation.NonNull;

import java.util.HashMap;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;

public class MainActivity extends FlutterActivity {


    ProgressDialog progressDialog;
    private final String PROGRESS_INDICATOR = "infyom.com/flutter";

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);
        MethodChannel channel = new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), PROGRESS_INDICATOR);
        channel.setMethodCallHandler(((call, result) -> {
            if (call.method.equals("showLoader")) {

                HashMap<String, Object> argument = (HashMap<String, Object>) call.arguments;
                Object isProgressShow = argument.get("loaderShow");
                String isDialogShow = "true";

                if (isDialogShow.equals(isProgressShow.toString())) {
                    setProgress(true);
                } else {
                    setProgress(false);
                }

                result.success(isProgressShow.toString());
            }
        }));

    }


    private void setProgress(boolean isProgress) {

        if (progressDialog != null && progressDialog.isShowing()) {
            progressDialog.dismiss();
            progressDialog = null;
        }
        if (isProgress) {
            progressDialog = new ProgressDialog(this, R.style.AppCompatAlertDialogStyle);
            progressDialog.setMessage("Please Wait...");
            progressDialog.show();
            /* progressDialog = ProgressDialog.show(this, null, getString(R.string.please_wait )); */
        }
    }

}
