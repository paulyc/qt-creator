/****************************************************************************
**
** Copyright (C) 2019 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of Qt Creator.
**
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see https://www.qt.io/terms-conditions. For further
** information use the contact form at https://www.qt.io/contact-us.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU
** General Public License version 3 as published by the Free Software
** Foundation with exceptions as appearing in the file LICENSE.GPL3-EXCEPT
** included in the packaging of this file. Please review the following
** information to ensure the GNU General Public License requirements will
** be met: https://www.gnu.org/licenses/gpl-3.0.html.
**
****************************************************************************/

import QtQuick 2.12
import QtQuick.Templates 2.12 as T
import StudioTheme 1.0 as StudioTheme

TextInput {
    id: textInput

    property T.Control myControl

    property bool edit: textInput.activeFocus
    property bool drag: false

    z: 2
    font: myControl.font
    color: StudioTheme.Values.themeTextColor
    selectionColor: StudioTheme.Values.themeTextSelectionColor
    selectedTextColor: StudioTheme.Values.themeTextSelectedTextColor

    horizontalAlignment: Qt.AlignLeft
    verticalAlignment: Qt.AlignVCenter
    leftPadding: StudioTheme.Values.inputHorizontalPadding
    rightPadding: StudioTheme.Values.inputHorizontalPadding

    readOnly: !myControl.editable
    validator: myControl.validator
    inputMethodHints: myControl.inputMethodHints
    selectByMouse: false
    activeFocusOnPress: false
    clip: true

    Rectangle {
        id: textInputArea
        x: 0
        y: 0
        z: -1
        width: textInput.width
        height: StudioTheme.Values.height
        color: StudioTheme.Values.themeControlBackground
        border.color: StudioTheme.Values.themeControlOutline
        border.width: StudioTheme.Values.border
    }

    TapHandler {
        id: tapHandler
        acceptedDevices: PointerDevice.Mouse
        enabled: true
        onTapped: {
            if (textInput.readOnly) {
                if (myControl.popup.opened) {
                    myControl.popup.close()
                } else {
                    myControl.popup.open()
                    myControl.forceActiveFocus()
                }
            } else {
                textInput.forceActiveFocus()
            }
        }
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        enabled: true
        hoverEnabled: true
        propagateComposedEvents: true
        acceptedButtons: Qt.LeftButton
        cursorShape: Qt.PointingHandCursor
        // Sets the global hover
        onContainsMouseChanged: myControl.hover = containsMouse
        onPressed: mouse.accepted = false
    }

    states: [
        State {
            name: "default"
            when: myControl.enabled && !textInput.edit
                  && !mouseArea.containsMouse && !myControl.drag
            PropertyChanges {
                target: textInputArea
                color: StudioTheme.Values.themeControlBackground
                border.color: StudioTheme.Values.themeControlOutline
            }
            PropertyChanges {
                target: mouseArea
                cursorShape: Qt.PointingHandCursor
            }
        },
        State {
            name: "hovered"
            when: myControl.hover && !textInput.edit && !myControl.drag
            PropertyChanges {
                target: textInputArea
                color: StudioTheme.Values.themeHoverHighlight
                border.color: StudioTheme.Values.themeControlOutline
            }
        },
        State {
            name: "focus"
            when: textInput.edit && !myControl.editable
            PropertyChanges {
                target: textInputArea
                color: StudioTheme.Values.themeFocusEdit
                border.color: StudioTheme.Values.themeInteraction
            }
        },
        State {
            name: "edit"
            when: textInput.edit && myControl.editable
            extend: "focus"
            PropertyChanges {
                target: tapHandler
                enabled: false
            }
            PropertyChanges {
                target: mouseArea
                cursorShape: Qt.IBeamCursor
            }
        },
        State {
            name: "disabled"
            when: !myControl.enabled
            PropertyChanges {
                target: textInputArea
                color: StudioTheme.Values.themeControlBackgroundDisabled
                border.color: StudioTheme.Values.themeControlOutlineDisabled
            }
            PropertyChanges {
                target: textInput
                color: StudioTheme.Values.themeTextColorDisabled
            }
        }
    ]
}
