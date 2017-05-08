import QtQuick 2.0
import Sailfish.Silica 1.0
import QtMultimedia 5.5
import QZXing 2.3

Page {

    Camera {
        id: camera
        focus {
            focusMode: CameraFocus.FocusContinuous
            focusPointMode: CameraFocus.FocusPointAuto
        }
    }

    VideoOutput {
        id: videoOutput
        source: camera
        anchors.fill: parent
        orientation: Orientation.All
        fillMode: VideoOutput.PreserveAspectFit
        filters: [ zxingFilter ]
        MouseArea {
            anchors.fill: parent
            onClicked: {
                camera.focus.customFocusPoint = Qt.point(mouse.x / width,  mouse.y / height);
                camera.focus.focusMode = CameraFocus.FocusMacro;
                camera.focus.focusPointMode = CameraFocus.FocusPointCustom;
            }
        }
        Rectangle {
            width: parent.width / 2
            height: parent.height / 2
            anchors.centerIn: parent
            color: "red"
            opacity: 0.2
        }
    }

    QZXingFilter {
        id: zxingFilter
        captureRect: {
            videoOutput.contentRect;
            videoOutput.sourceRect;
            return videoOutput.mapRectToSource(
                        videoOutput.mapNormalizedRectToItem(Qt.rect(0.25, 0.25, 0.5, 0.5)));
        }
        decoder {
            tryHarder: false
            enabledDecoders: QZXing.DecoderFormat_EAN_13 | QZXing.DecoderFormat_CODE_39
                             | QZXing.DecoderFormat_QR_CODE
            onTagFound: {
                console.log(tag);
            }
        }
        onDecodingStarted: {
            console.log("started");
        }
        onDecodingFinished: {
           console.log("frame finished: " + succeeded);
        }
    }
}
