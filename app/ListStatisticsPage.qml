import QtQuick 2.0
import Ubuntu.Components 1.3
import QtQuick.LocalStorage 2.0

import "js/Storage.js" as Storage

Page {
    id: root
    property string unitStr: "KG"
    header: PageHeader {
        id: main_header
        title: i18n.tr("Weight statistics")
        StyleHints {
            foregroundColor:Qt.darker( UbuntuColors.green)
            dividerColor: Qt.darker( UbuntuColors.green)
        }
        leadingActionBar.actions: [
            Action {
                iconName: "back"
                onTriggered: {
                    pageLayout.removePages(listStatisticsPage)
                    columnAdded = false
                }
            }
        ]
    }
    Flickable {
        id: flickable
        anchors {
            top: main_header.bottom
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }
        contentHeight: statisticsColumn.height + units.gu(5)

        Column {
            id: statisticsColumn
            anchors {
                top: parent.top
                left: parent.left
                right: parent.right
            }

            ListItem {
                id: avarageHeaderListItem
                height: units.gu(4)
                Label {
                    anchors { verticalCenter: parent.verticalCenter; left: parent.left; leftMargin: units.gu(2) }
                    text: i18n.tr("Average weight:")
                    font.bold: false
                    color:Qt.darker( UbuntuColors.green)

                }
            }
            ListItem {
                ListItemLayout {
                    title.text: i18n.tr("Average last week")
                    title.color:Qt.darker( UbuntuColors.green)
                    Label {
                        id:avgLastWeek
                        text:""
                        color:Qt.darker( UbuntuColors.green)
                    }
                }
            }
            ListItem {
                ListItemLayout {
                    title.text: i18n.tr("Average last month")
                    title.color:Qt.darker( UbuntuColors.green)
                    Label {
                        id:avgLastMonth
                        text:""
                        color:Qt.darker( UbuntuColors.green)
                    }
                }
            }
            ListItem {
                ListItemLayout {
                    title.text: i18n.tr("Average last year")
                    title.color:Qt.darker( UbuntuColors.green)
                    Label {
                        id:avgLastYear
                        text:""
                        color:Qt.darker( UbuntuColors.green)
                    }
                }
            }
            ListItem {
                id: changesHeaderListItem
                height: units.gu(4)
                Label {
                    anchors { verticalCenter: parent.verticalCenter; left: parent.left; leftMargin: units.gu(2) }
                    text: i18n.tr("Changes in weight:")
                    font.bold: false
                    color:Qt.darker( UbuntuColors.green)

                }
            }
            ListItem {
                ListItemLayout {
                    title.text: i18n.tr("Changes last week")
                    title.color:Qt.darker( UbuntuColors.green)
                    Label {
                        id:changesLastWeek
                        text:""
                        color:Qt.darker( UbuntuColors.green)
                    }
                }
            }
            ListItem {
                ListItemLayout {
                    title.text: i18n.tr("Changes last month")
                    title.color:Qt.darker( UbuntuColors.green)
                    Label {
                        id:changesLastMonth
                        text:""
                        color:Qt.darker( UbuntuColors.green)
                    }
                }
            }
            ListItem {
                ListItemLayout {
                    title.text: i18n.tr("Changes last year")
                    title.color:Qt.darker( UbuntuColors.green)
                    Label {
                        id:changesLastYear
                        text:""
                        color:Qt.darker( UbuntuColors.green)
                    }
                }
            }
            ListItem {
                ListItemLayout {
                    title.text: i18n.tr("Changes from start")
                    title.color:Qt.darker( UbuntuColors.green)
                    Label {
                        id:changesFromStart
                        text:""
                        color:Qt.darker( UbuntuColors.green)
                    }
                }
            }
            ListItem {
                id: generalHeaderListItem
                height: units.gu(4)
                Label {
                    anchors { verticalCenter: parent.verticalCenter; left: parent.left; leftMargin: units.gu(2) }
                    text: i18n.tr("General:")
                    font.bold: false
                    color:Qt.darker( UbuntuColors.green)

                }
            }
            ListItem {
                ListItemLayout {
                    title.text: i18n.tr("The highest weight")
                    title.color:Qt.darker( UbuntuColors.green)
                    Label {
                        id:maximumWeight
                        text:""
                        color:Qt.darker( UbuntuColors.green)
                    }
                }
            }
            ListItem {
                ListItemLayout {
                    title.text: i18n.tr("The lowest weight")
                    title.color:Qt.darker( UbuntuColors.green)
                    Label {
                        id:minimumWeight
                        text:""
                        color:Qt.darker( UbuntuColors.green)
                    }
                }
            }
            Component.onCompleted: {
                updateView();
            }

        }
    }
    function updateView(){
        if(settings.unit ===0){
            unitStr= i18n.tr("KG");
        }else{
            unitStr= i18n.tr("LB");
        }
        avgLastWeek.text= Storage.getWeightAvgOnPeriod("lastWeek",settings.userId).toFixed(2)+unitStr;
        avgLastMonth.text= Storage.getWeightAvgOnPeriod("lastMonth",settings.userId).toFixed(2)+unitStr;
        avgLastYear.text= Storage.getWeightAvgOnPeriod("lastYear",settings.userId).toFixed(2)+unitStr;
        var cLastWeek=Storage.getWeightChangesOnPeriod("lastWeek",settings.userId).toFixed(2)
         var cLastMonth=Storage.getWeightChangesOnPeriod("lastMonth",settings.userId).toFixed(2)
         var cLastYear=Storage.getWeightChangesOnPeriod("lastYear",settings.userId).toFixed(2)
         var cFromStart=Storage.getWeightChangesOnPeriod("all",settings.userId).toFixed(2)
        changesLastWeek.text=cLastWeek>0?"+"+ cLastWeek+unitStr:cLastWeek+unitStr;
        changesLastMonth.text= cLastMonth>0?"+"+ cLastMonth+unitStr:cLastMonth+unitStr;
        changesLastYear.text= cLastYear>0?"+"+ cLastYear+unitStr:cLastYear+unitStr;
        changesFromStart.text= cFromStart>0?"+"+ cFromStart+unitStr:cFromStart+unitStr;
        maximumWeight.text= Storage.getMaxWeight(settings.userId)+unitStr;
        minimumWeight.text= Storage.getMinWeight(settings.userId)+unitStr;
    }
}




