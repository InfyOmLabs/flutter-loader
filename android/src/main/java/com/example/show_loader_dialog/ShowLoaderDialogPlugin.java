package com.example.show_loader_dialog;

import android.app.Activity;
import android.app.ProgressDialog;

import androidx.annotation.NonNull;

import java.util.HashMap;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

/** ShowLoaderDialogPlugin */
public class ShowLoaderDialogPlugin implements FlutterPlugin, MethodCallHandler, ActivityAware {

  ProgressDialog progressDialog;
  private MethodChannel channel;
  private Activity activity;

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }

  @Override
  public void onAttachedToActivity(@NonNull ActivityPluginBinding binding) {
    this.activity = binding.getActivity();
  }

  @Override
  public void onDetachedFromActivityForConfigChanges() {
    this.activity = null;
  }

  @Override
  public void onReattachedToActivityForConfigChanges(@NonNull ActivityPluginBinding binding) {
    this.activity = binding.getActivity();
  }

  @Override
  public void onDetachedFromActivity() {
    this.activity = null;
  }

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "infyom.com/flutter");
    channel.setMethodCallHandler(this);
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
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
    } else {
      result.notImplemented();
    }
  }

  private void setProgress(boolean isProgress) {
    if (progressDialog != null && progressDialog.isShowing()) {
      progressDialog.dismiss();
      progressDialog = null;
    }
    if (isProgress) {
      progressDialog = new ProgressDialog(activity, R.style.AppCompatAlertDialogStyle);
      progressDialog.setMessage("Please Wait...");
      progressDialog.show();
      /* progressDialog = ProgressDialog.show(this, null, getString(R.string.please_wait )); */
    }
  }

}
