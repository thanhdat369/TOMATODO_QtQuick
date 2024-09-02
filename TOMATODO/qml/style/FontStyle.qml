pragma Singleton

import QtQuick 2.15

QtObject {
	readonly property FontLoader ubuntuMonoBold: FontLoader { source: "qrc:/assets/fonts/Ubuntu_Mono/UbuntuMono-Bold.ttf" }
	readonly property FontLoader ubuntuMonoBoldItalic: FontLoader { source: "qrc:/assets/fonts/Ubuntu_Mono/UbuntuMono-BoldItalic.ttf" }
	readonly property FontLoader ubuntuMonoItalic: FontLoader { source: "qrc:/assets/fonts/Ubuntu_Mono/UbuntuMono-Italic.ttf" }
	readonly property FontLoader ubuntuMonoRegular: FontLoader { source: "qrc:/assets/fonts/Ubuntu_Mono/UbuntuMono-Regular.ttf" }
}
