/**
 * This Source Code Form is subject to the terms of the Mozilla Public License,
 * v. 2.0. If a copy of the MPL was not distributed with this file, You can
 * obtain one at http://mozilla.org/MPL/2.0/. OpenMRS is also distributed under
 * the terms of the Healthcare Disclaimer located at http://openmrs.org/license.
 *
 * Copyright (C) OpenMRS Inc. OpenMRS is a registered trademark and the OpenMRS
 * graphic logo is a trademark of OpenMRS Inc.
 */
package org.openmrs.module.visitdocumentsui;

public class VisitDocumentsConstants {
   
   public static enum ContentFamily {
      IMAGE,
      OTHER
   }

   /*
    * Module ids
    */
   public static final String MODULE_NAME = "Visit Documents UI";
   
   public static final String MODULE_ARTIFACT_ID = "visitdocumentsui";

   public static final String MODULE_SHORT_ID = "VDUI";

   public static final String MODULE_CONTEXT_QUALIFIER = "visitDocumentsContext";

   public static final String MODULE_BASE_URL = "/" + MODULE_ARTIFACT_ID;

   public static final String UPLOAD_DOCUMENT_URL = MODULE_BASE_URL + "/upload";

   public static final String DOWNLOAD_DOCUMENT_URL = MODULE_BASE_URL + "/download";

   /*
    * Docs config
    */
   public static final String INSTRUCTIONS_PREFIX = "instructions";
   
   public static final String UNKNOWN_MIME_TYPE = "application/octet-stream";

   public static final String DOC_VIEW_ORIGINAL = "complexdata.view.original";

   public static final String DOC_VIEW_THUMBNAIL = "complexdata.view.thumbnail";

   public static final String DOC_VIEW_CRUD = DOC_VIEW_ORIGINAL;  // Use this view for CRUD operations where a view must be provided.

   /*
    * Global properties
    */
   public static final String GP_DEFAULT_CONCEPT_COMPLEX_UUID = MODULE_ARTIFACT_ID + ".defaultConceptComplexUuid";

   public static final String GP_CONCEPT_COMPLEX_UUID_MAP = MODULE_ARTIFACT_ID + ".conceptComplexUuidMap";  // Map between content families and concept complex UUIDs
   
   public static final String GP_CONCEPT_COMPLEX_UUID_LIST = MODULE_ARTIFACT_ID + ".conceptComplexUuidList";  // List of concepts complex UUIDs for listing/viewing.
   
   public static final String GP_ENCOUNTER_TYPE_UUID = MODULE_ARTIFACT_ID + ".encounterTypeUuid";

   public static final String GP_MAX_UPLOAD_FILE_SIZE = MODULE_ARTIFACT_ID + ".maxUploadFileSize";

   public static final String GP_MAX_STORAGE_FILE_SIZE = MODULE_ARTIFACT_ID + ".maxStorageFileSize";

   public static final String GP_ENCOUNTER_SAVING_FLOW = MODULE_ARTIFACT_ID + ".encounterSavingFlow";

   public static final String GP_ALLOW_NO_CAPTION = MODULE_ARTIFACT_ID + ".allowNoCaption";

   /*
    * REST
    */
   public static final String REPRESENTATION_OBS = "(uuid:ref,comment:ref,obsDatetime:ref)";
}