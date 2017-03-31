package com.magicud.scanditsdk;

import com.facebook.react.bridge.Callback;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.scandit.barcodepicker.ScanditLicense;

/**
 * Created by phamducgiam on 12/5/16.
 */

public class ScanditSDKModule extends ReactContextBaseJavaModule {

    public ScanditSDKModule(ReactApplicationContext reactContext) {
        super(reactContext);
    }

    @Override
    public String getName() {
        return "ScanditSDK";
    }

    @ReactMethod
    public void init(String appKey) {
        ScanditLicense.setAppKey(appKey);
    }

    @ReactMethod
    public void scan(Callback callback) {
        callback.invoke();
    }
}
