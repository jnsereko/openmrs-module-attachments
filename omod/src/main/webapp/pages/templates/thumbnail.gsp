<style>

	/* Credits to: https://designshack.net/articles/css/how-to-build-a-responsive-thumbnail-gallery/ */

	/* MEDIA QUERIES*/
	@media only screen and (max-width : 940px),
	only screen and (max-device-width : 940px){
		.vdui_thumbnail-container {width: 21%;}
	}

	@media only screen and (max-width : 720px),
	only screen and (max-device-width : 720px){
		.vdui_thumbnail-container {width: 29.33333%;}
	}

	@media only screen and (max-width : 530px),
	only screen and (max-device-width : 530px){
		.vdui_thumbnail-container {width: 46%;}
	}

	@media only screen and (max-width : 320px),
	only screen and (max-device-width : 320px){
		.vdui_thumbnail-container {width: 96%;}
		.vdui_thumbnail-container img {width: 96%;}
		.vdui_thumbnail-container object {width: 96%;}
	}

	.vdui_header {
		position: relative;
		height: 15px;
	}

	.vdui_thumbnail-container {
		float: left;

		width: 16%;	/* Example for 5 thumbnails: 100/5 - the left and right margins below */
	 	margin:  2% 2% 30px 2%;

	 	height: 150px; /* Controls the height of the whole thumbnail */
	}

	.vdui_date-time {
		font-size: 65%;
		font-weight: bold;
		color: #888;
	}

	.vdui_thumbnail-caption-section p {
		font-size: 90%;
	}

	.vdui_editable p:hover {
		background-color: #F5F5F5;
		color: #F26522;
		font-weight: bold;
		
		-webkit-border-radius: 3px;
		-moz-border-radius: 3px;
		border-radius: 3px;
		padding: 3px;
		cursor: pointer;
	}

	.vdui_thumbnail-image-section {
		position: relative;
		height: 110px; /* Controls the height of the image */
	}

	.vdui_generic-thumbnail {
		height: 110px; /* Controls the height */

		border: 3px solid #F4F4F4;

		-webkit-border-radius: 5px;
		-moz-border-radius: 5px;
		border-radius: 5px;
		padding: 5px;
	}

	.vdui_generic-thumbnail span {
		position: absolute;
		bottom: 10%;
		left: 10%;

		font-size: smaller;
	}

	.vdui_thumbnail-container img {
		max-width: 100%;
		-webkit-border-radius: 5px;
		-moz-border-radius: 5px;
		border-radius: 5px;

		max-height: 110px; /* Controls the height of the image */
	}

	.vdui_thumbnail-container img:hover {
		cursor: pointer;
	}

	.vdui_thumbnail-caption-section {
		margin-top: 20px;
		position: relative;
	}

	.vdui_icon-trash {
		position: absolute;
    left: 0;
    top: 0;

    font-size: 250%
	}

	.vdui_thumbnail-edit-mode .vdui_opacity-changeable {
		-moz-opacity: 0.15;
		opacity:.15;
		filter: alpha(opacity=15);
	}

	.vdui_thumbnail-edit-mode img:hover {
		cursor: auto;
	}

	.vdui_click-pointer {
		cursor: pointer;
	}

</style>

<script type="text/ng-template" id="vdui_thumbnail-confirm-dialog">
    <div>
      <div class="dialog-header">
        <h3>${ ui.message("visitdocumentsui.visitdocumentspage.delete.title") }</h3>
	    </div>
	    <div class="dialog-content">
        <input type="hidden" id="encounterId" value=""/>
        <ul>
          <li class="info">
						<span>${ ui.message("visitdocumentsui.visitdocumentspage.delete.confirm") }</span>
          </li>
        </ul>

        <button class="confirm right" ng-click="confirm()">${ ui.message("coreapps.yes") }
        	<i ng-show="showSpinner" class="icon-spinner icon-spin icon-2x" style="margin-left: 10px;"></i>
        </button>
        <button class="cancel" ng-click="closeThisDialog()">${ ui.message("coreapps.no") }</button>
	    </div>
    </div>
</script>

<vdui-modal-image></vdui-modal-image>

<div ng-show="active" class="vdui_thumbnail-container" ng-class="getEditModeCss()">

	<div class="vdui_header">
		<p class="vdui_date-time left"><time datetime="{{obs.obsDatetime}}">{{getPrettyDate()}}</time></p>
	</div>
	<div class="vdui_thumbnail-image-section vdui_click-pointer" ng-click="!editMode && displayContent()">
		<div class="vdui_opacity-changeable">
			<div ng-hide="obs.complexData" class="vdui_generic-thumbnail">
				<i class="icon-file icon-4x left"></i>
				<span ng-show="obs.contentFamily && obs.fileExt">{{obs.contentFamily.toLowerCase()}} / .{{obs.fileExt}}<span>
			</div>
			<div ng-show="obs.complexData" class="vdui_generic-thumbnail">
				<img ng-src="data:{{obs.mimeType}};base64,{{obs.complexData}}"></img>
			</div>
		</div>
		<i ng-show="editMode" class="icon-trash vdui_icon-trash vdui_click-pointer" ng-click="confirmDelete()"></i>
	</div>

	<div class="vdui_thumbnail-caption-section" ng-class="canEdit() ? 'vdui_editable' : ''">
		<div ng-hide="editMode" ng-click="toggleEditMode(true)">
			<i ng-hide="obs.comment" class="icon-tag vdui_side"></i>
			<p ng-show="obs.comment">{{obs.comment}}</p>
		</div>
		<div ng-show="editMode" vdui-escape-key-down="toggleEditMode(false)">
	    <input ng-model="newCaption" class="left" type="text" vdui-enter-key-down="saveCaption()"/>
	    <span class="right">
	      <i class="icon-ok vdui_click-pointer" ng-click="saveCaption()"></i>
	      <i class="icon-remove vdui_click-pointer" ng-click="toggleEditMode(false)"></i>
	    </span>
	  </div>
	  <i ng-show="loading" class="icon-spinner icon-spin" style="margin-left: 10px;"></i>
  </div>

</div>