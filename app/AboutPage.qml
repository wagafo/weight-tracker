import QtQuick 2.0
import Ubuntu.Components 1.3
import Ubuntu.Components.ListItems 1.0
Page {
    id: root_about
    header: PageHeader {
        id: main_header
        title: i18n.tr("About")
        StyleHints {
            foregroundColor:Qt.darker( UbuntuColors.green)
            dividerColor: Qt.darker( UbuntuColors.green)
        }
        leadingActionBar.actions: [
            Action {
                iconName: "back"
                onTriggered: {
                    pageLayout.removePages(aboutPage)
                    columnAdded = false
                }
            }
        ]
    }
    Flickable {
        id: page_flickable
        anchors {
            top: main_header.bottom
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }

        contentHeight:  main_column.height + units.gu(2)
        clip: true

        Column {
            id: main_column
            anchors {
                topMargin: units.gu(2)
                left: parent.left
                right: parent.right
                top: parent.top
            }
            Item {
                id: icon
                width: parent.width
                height: app_icon.height + units.gu(1)
                UbuntuShape {
                    id: app_icon
                    width: Math.min(root_about.width/3, 256)
                    height: width
                    anchors.centerIn: parent
                    source: Image {
                        id: icon_image
                        //TODO: fix this ugly path
                        source: "../../../graphics/weight-tracker.png"
                    }
                    radius: "medium"
                    aspect: UbuntuShape.DropShadow
                }
            }
            Label {
                id: name
                height: implicitHeight + units.gu(3)
                text: i18n.tr("Weight Tracker %1 (Beta)").arg("v0.5.2")
                color:Qt.darker( UbuntuColors.green)
                anchors.horizontalCenter: parent.horizontalCenter
                textSize: Label.Large
                horizontalAlignment:  Text.AlignHCenter
            }
            ThinDivider{                anchors.topMargin: units.gu(2)
            }

            ListItem {
                ListItemLayout {
                    Icon {
                        name: "stock_website"
                        color: Qt.darker(UbuntuColors.green)
                        SlotsLayout.position: SlotsLayout.Leading;
                        width: units.gu(3)
                    }
                    title.text: i18n.tr("Source Code")
                    title.color:Qt.darker( UbuntuColors.green)
                    Label { text: i18n.tr("Github")
                        color:Qt.darker( UbuntuColors.green) }
                    ProgressionSlot {}
                }
                onClicked: {Qt.openUrlExternally('https://github.com/wagafo/weight-tracker')}
            }

            ListItem {
                ListItemLayout {
                    Icon {
                        name: "compose"
                        color: Qt.darker(UbuntuColors.green)
                        SlotsLayout.position: SlotsLayout.Leading;
                        width: units.gu(3)
                    }
                    title.text: i18n.tr("Report bug")
                    title.color:Qt.darker( UbuntuColors.green)
                    Label { text: i18n.tr("Github")
                        color:Qt.darker( UbuntuColors.green) }
                    ProgressionSlot {}
                }
                onClicked: {Qt.openUrlExternally('https://github.com/wagafo/weight-tracker/issues')}
            }
            ListItem {
                ListItemLayout {
                    Icon {
                        name: "note"
                        color: Qt.darker(UbuntuColors.green)
                        SlotsLayout.position: SlotsLayout.Leading;
                        width: units.gu(3)
                    }
                    title.text: i18n.tr("License")
                    title.color:Qt.darker( UbuntuColors.green)
                    Label { text:  i18n.tr("GPL-3.0 License")
                        color:Qt.darker( UbuntuColors.green) }
                    ProgressionSlot {}
                }
                onClicked: {Qt.openUrlExternally('https://opensource.org/licenses/GPL-3.0')}
            }
            ListItem {
                ListItemLayout {
                    Icon {
                        name: "thumb-up"
                        color: Qt.darker(UbuntuColors.green)
                        SlotsLayout.position: SlotsLayout.Leading;
                        width: units.gu(3)
                    }
                    title.text: i18n.tr("Original Author")
                    title.color:Qt.darker( UbuntuColors.green)
                    Label { text: "Avi Mar"
                        color:Qt.darker( UbuntuColors.green) }

                    ProgressionSlot {}
                }
                onClicked: {Qt.openUrlExternally('https://plus.google.com/108896809103329612102')}
            }
            ListItem {
                ListItemLayout {
                    Icon {
                        name: "contact"
                        color: Qt.darker(UbuntuColors.green)
                        SlotsLayout.position: SlotsLayout.Leading;
                        width: units.gu(3)
                    }
                    title.text: i18n.tr("Current Author")
                    title.color:Qt.darker( UbuntuColors.green)
                    Label { text: "Walter Garcia-Fontes"
                        color:Qt.darker( UbuntuColors.green) }

                    ProgressionSlot {}
                }
                onClicked: {Qt.openUrlExternally('http://puna.upf.edu')}
            }
            ListItem {
                ListItemLayout {
                    Icon {
                        name: "stock_application"
                        color: Qt.darker(UbuntuColors.green)
                        SlotsLayout.position: SlotsLayout.Leading;
                        width: units.gu(3)
                    }
                    title.text: i18n.tr("My other apps")
                    title.color:Qt.darker( UbuntuColors.green)
                    ProgressionSlot {}
                }
                onClicked: Qt.openUrlExternally('https://open-store.io/?sort=relevance&search=author%3AWalter%20Garcia-Fontes')
            }
        }

    }

}

