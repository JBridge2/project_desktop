pragma Singleton
import QtQuick
import Quickshell
import Quickshell.Services.Mpris

Singleton {
    id: root
    
    property ScriptModel allPlayersModel: ScriptModel {
        values: Mpris.players.values
    }
    property MprisPlayer _lastActive: null
    property MprisPlayer player: { 
        // Find the one currently playing
        const playing = Mpris.players.values.find(p => p.playbackState === MprisPlaybackState.Playing)
        
        if (playing) {
            _lastActive = playing
            return playing
        }

        // If nothing is playing, return last used player if still alive
        if (_lastActive && Mpris.players.values.includes(_lastActive)) {
            return _lastActive
        }
        // Absolute fallback if the last one was closed: grab whatever is first
        return Mpris.players.values[0] ?? null
    }

    property string title: player?.trackTitle || "No active music player"
    property string album: player?.trackAlbum || ""
    property string artist: player?.trackArtist || ""
    property string artUrl: player?.trackArtUrl ? player?.trackArtUrl : player?.desktopEntry ? "image://icon/" + player?.desktopEntry : ""

    Timer {
        id: positionTimer
        interval: 1000
        running: Mpris.players.values.some(p => p.playbackState === MprisPlaybackState.Playing)
        repeat: true
        onTriggered: {
            for (let p of Mpris.players.values) {
                if (p.playbackState === MprisPlaybackState.Playing) {
                    p.positionChanged()
                }
            }
        }
    }

    // Helper to calculate percentage (0.0 to 1.0)
    function getProgress(p) {
        if (!p || p.length <= 0) return 0;
        return p.position / p.length;
    }
}