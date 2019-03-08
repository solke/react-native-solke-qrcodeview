package com.solke.qrcodeview;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Color;
import android.text.TextUtils;
import android.widget.ImageView;
import android.widget.Toast;

import com.facebook.react.bridge.ReadableMap;
import com.facebook.react.uimanager.SimpleViewManager;
import com.facebook.react.uimanager.ThemedReactContext;
import com.facebook.react.uimanager.ViewProps;
import com.facebook.react.uimanager.annotations.ReactProp;
import cn.bingoogolapple.qrcode.core.BGAQRCodeUtil;
import cn.bingoogolapple.qrcode.zxing.QRCodeEncoder;
import javax.annotation.Nullable;

public class RNQRcodeViewManager extends SimpleViewManager<ImageView> {
    public static final String REACT_CLASS = "RNQRcodeView";
    private Context mContext;
    @Override
    public String getName() {
        return REACT_CLASS;
    }

    @Override
    protected ImageView createViewInstance(ThemedReactContext reactContext) {
        mContext = reactContext;
        return new ImageView(reactContext);
    }

    @ReactProp(name = "qrOptions")
    public void setQrValue(final ImageView view, @Nullable final ReadableMap qrOptions){
        final int size = qrOptions.getInt("size");
        final String qrValue = qrOptions.getString("value");
        final String foregroundColor = qrOptions.getString("foregroundColor");
        final String backgroundColor = qrOptions.getString("backgroundColor");
        if(!TextUtils.isEmpty(String.valueOf(size)) && qrValue != null){
            new Thread(new Runnable() {
                @Override
                public void run() {
                    String fgColor = "#000000";
                    if(foregroundColor != null){
                        fgColor = foregroundColor;
                    }
                    String bgColor = "#ffffff";
                    if(backgroundColor != null){
                        bgColor = backgroundColor;
                    }
                    try {
                        int fgColorValue = Color.parseColor(fgColor);
                        int bgColorValue = Color.parseColor(bgColor);
                        final Bitmap bitmap = QRCodeEncoder.syncEncodeQRCode(qrValue, BGAQRCodeUtil.dp2px(mContext, size), fgColorValue,bgColorValue,null);
                        view.post(new Runnable() {
                            @Override
                            public void run() {
                                if (bitmap != null) {
                                    view.setImageBitmap(bitmap);
                                }
                            }
                        });
                    }catch (Exception e){

                    }

                }
            }).start();
        }
    }

    @ReactProp(name = ViewProps.RESIZE_MODE)
    public void setResizeMode(ImageView view, @Nullable String resizeMode) {
        ImageView.ScaleType scaleType = ImageView.ScaleType.CENTER;
        if ("contain".equals(resizeMode)) {
            scaleType = ImageView.ScaleType.CENTER_INSIDE;
        }
        view.setScaleType(scaleType);
    }

}
