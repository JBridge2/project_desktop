pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Services.Pipewire

Singleton {
    id: root

    // ---------- Config ----------
    property int minVolume: 0
    property int maxVolume: 1

    // ---------- Default Nodes ----------
    readonly property PwNode defaultSink: Pipewire.defaultAudioSink
    readonly property PwNode defaultSource: Pipewire.defaultAudioSource


    // ---------- List Nodes ----------
    readonly property var devices: Pipewire.nodes.values
    .filter(n => {
        const type = String(PwNodeType.toString?.(n.type) || PwNodeType[n.type]);
        return n.audio && (type === "AudioSink" || type === "AudioSource");
    })
    .sort((a, b) => b.type - a.type)

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