pragma Singleton

import QtQuick

QtObject {
	property bool isDark: true
	readonly property color mainColor: "#FD6D64"
	readonly property color mainHoverColor: "#378AA5"
	readonly property color secondaryColor: "#3EB06C"
	readonly property color backgroundColor: isDark ? "#000000" : lightColor
	readonly property color textColor: isDark ? textLightColor: textDarkColor
	readonly property color darkColor:  "#3B3B3B"
	readonly property color lightColor: "#FFFFFF"
	readonly property color textDarkColor: "#000000"
	readonly property color textLightColor: "#FFFFFF"
}
