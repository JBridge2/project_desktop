pragma Singleton
import QtQuick
import Quickshell

Singleton {
    
    // 
    readonly property color base: "#2c2c2c"
    readonly property color surface: "#3c3c3c"
    readonly property color accent: "#89b4fa"

    // 
    readonly property color border: "#5d5d5d"
    readonly property color surfaceHigh: "#4d4d4d"

    // -------------------- Text ------------------------------
    readonly property color text: "#ffffff"
    readonly property color textMuted: "#d0d0d0"
    readonly property color textDim: "#a0a0a0"

    // 
    readonly property color connected: "#0080ff"
    readonly property color disconnected: "#6d6d6d"

    //

    // --- Dimensions & Spacing ---
    readonly property int barHeight: 40
    readonly property int padding: 8
    readonly property int spacing: 6
    readonly property int cornerRadius: 8
    
    // --- Animation Speeds ---
    readonly property int transitionFast: 150
    readonly property int transitionSlow: 300

    // --- Text Styles ---
    readonly property string fontFamily: "Sans"
    readonly property int fontSizeLarge: 16
    readonly property int fontSize: 14
    readonly property int fontSizeSmall: 12

    // 

}