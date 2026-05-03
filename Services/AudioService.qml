pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Services.Pipewire

Singleton {
    id: root

    // ---------- Config ----------
    property real minVolume: 0
    property real maxVolume: 1

    // ---------- Default Nodes ----------
    readonly property PwNode defaultSink: Pipewire.defaultAudioSink
    readonly property PwNode defaultSource: Pipewire.defaultAudioSource


    // ---------- List Nodes ----------
    property ScriptModel sinksModel: ScriptModel {
        values: Pipewire.nodes.values.filter(n => n.isSink)
    }
    

    // ---------- Set Default Nodes ----------
    function setDefaultSink(sink) {
        if (sink) Pipewire.prefferedDefaultAudioSink = sink;
    }

    function setDefaultSource(source) {
        if (source) Pipewire.prefferedDefaultAudioSource = source;
    }


    // ---------- Volume Controls ----------
    function setVolume(node, volume) {
        if (node && node?.audio) {
            node.audio.muted = false;
            node.audio.volume = Math.max(minVolume, Math.min(maxVolume, volume))
        }
  
    }

    function changeVolume(node, amount) {

    }

    function toggleMuted(node) {

    }

    PwObjectTracker {
        objects: [
            Pipewire.defaultAudioSink,
            Pipewire.defaultAudioSource
        ]
    }
}