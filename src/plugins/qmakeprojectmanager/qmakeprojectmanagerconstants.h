/****************************************************************************
**
** Copyright (C) 2014 Digia Plc and/or its subsidiary(-ies).
** Contact: http://www.qt-project.org/legal
**
** This file is part of Qt Creator.
**
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and Digia.  For licensing terms and
** conditions see http://qt.digia.com/licensing.  For further information
** use the contact form at http://qt.digia.com/contact-us.
**
** GNU Lesser General Public License Usage
** Alternatively, this file may be used under the terms of the GNU Lesser
** General Public License version 2.1 as published by the Free Software
** Foundation and appearing in the file LICENSE.LGPL included in the
** packaging of this file.  Please review the following information to
** ensure the GNU Lesser General Public License version 2.1 requirements
** will be met: http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html.
**
** In addition, as a special exception, Digia gives you certain additional
** rights.  These rights are described in the Digia Qt LGPL Exception
** version 1.1, included in the file LGPL_EXCEPTION.txt in this package.
**
****************************************************************************/

#ifndef QMAKEPROJECTMANAGERCONSTANTS_H
#define QMAKEPROJECTMANAGERCONSTANTS_H

#include <QtGlobal>

namespace QmakeProjectManager {
namespace Constants {

// Contexts
const char C_PROFILEEDITOR[] = ".pro File Editor";

// Menus
const char M_CONTEXT[] = "ProFileEditor.ContextMenu";

// Kinds
const char PROJECT_ID[] = "Qt4.Qt4Project";
const char PROFILE_EDITOR_ID[] = "Qt4.proFileEditor";
const char PROFILE_EDITOR_DISPLAY_NAME[] = QT_TRANSLATE_NOOP("OpenWith::Editors", ".pro File Editor");
const char PROFILE_MIMETYPE[] = "application/vnd.qt.qmakeprofile";
const char PROINCLUDEFILE_MIMETYPE [] = "application/vnd.qt.qmakeproincludefile";
const char PROFEATUREFILE_MIMETYPE [] = "application/vnd.qt.qmakeprofeaturefile";

// Actions
const char RUNQMAKE[] = "Qt4Builder.RunQMake";
const char RUNQMAKECONTEXTMENU[] = "Qt4Builder.RunQMakeContextMenu";
const char BUILDSUBDIR[] = "Qt4Builder.BuildSubDir";
const char REBUILDSUBDIR[] = "Qt4Builder.RebuildSubDir";
const char CLEANSUBDIR[] = "Qt4Builder.CleanSubDir";
const char BUILDFILE[] = "Qt4Builder.BuildFile";
const char BUILDSUBDIRCONTEXTMENU[] = "Qt4Builder.BuildSubDirContextMenu";
const char REBUILDSUBDIRCONTEXTMENU[] = "Qt4Builder.RebuildSubDirContextMenu";
const char CLEANSUBDIRCONTEXTMENU[] = "Qt4Builder.CleanSubDirContextMenu";
const char BUILDFILECONTEXTMENU[] = "Qt4Builder.BuildFileContextMenu";
const char ADDLIBRARY[] = "Qt4.AddLibrary";

// Tasks
const char PROFILE_EVALUATE[] = "Qt4ProjectManager.ProFileEvaluate";

// Project
const char QMAKEPROJECT_ID[] = "Qt4ProjectManager.Qt4Project";

// ICONS
const char ICON_QTQUICK_APP[] = ":/wizards/images/qtquickapp.png";

// Env variables
const char QMAKEVAR_QMLJSDEBUGGER_PATH[] = "QMLJSDEBUGGER_PATH";
const char QMAKEVAR_QUICK1_DEBUG[] = "CONFIG+=declarative_debug";
const char QMAKEVAR_QUICK2_DEBUG[] = "CONFIG+=qml_debug";

} // namespace Constants
} // namespace QmakeProjectManager

#endif // QMAKEPROJECTMANAGERCONSTANTS_H
