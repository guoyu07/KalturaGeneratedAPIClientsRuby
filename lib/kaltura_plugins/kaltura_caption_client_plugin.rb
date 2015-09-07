# ===================================================================================================
#                           _  __     _ _
#                          | |/ /__ _| | |_ _  _ _ _ __ _
#                          | ' </ _` | |  _| || | '_/ _` |
#                          |_|\_\__,_|_|\__|\_,_|_| \__,_|
#
# This file is part of the Kaltura Collaborative Media Suite which allows users
# to do with audio, video, and animation what Wiki platfroms allow them to do with
# text.
#
# Copyright (C) 2006-2015  Kaltura Inc.
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <http:#www.gnu.org/licenses/>.
#
# @ignore
# ===================================================================================================
require 'kaltura_client.rb'

module Kaltura

	class KalturaCaptionAssetStatus
		ERROR = -1
		QUEUED = 0
		READY = 2
		DELETED = 3
		IMPORTING = 7
		EXPORTING = 9
	end

	class KalturaCaptionAssetOrderBy
		CREATED_AT_ASC = "+createdAt"
		DELETED_AT_ASC = "+deletedAt"
		SIZE_ASC = "+size"
		UPDATED_AT_ASC = "+updatedAt"
		CREATED_AT_DESC = "-createdAt"
		DELETED_AT_DESC = "-deletedAt"
		SIZE_DESC = "-size"
		UPDATED_AT_DESC = "-updatedAt"
	end

	class KalturaCaptionParamsOrderBy
	end

	class KalturaCaptionType
		SRT = "1"
		DFXP = "2"
		WEBVTT = "3"
	end

	class KalturaCaptionAsset < KalturaAsset
		# The Caption Params used to create this Caption Asset
		# 	 
		attr_accessor :caption_params_id
		# The language of the caption asset content
		# 	 
		attr_accessor :language
		# The language of the caption asset content
		# 	 
		attr_accessor :language_code
		# Is default caption asset of the entry
		# 	 
		attr_accessor :is_default
		# Friendly label
		# 	 
		attr_accessor :label
		# The caption format
		# 	 
		attr_accessor :format
		# The status of the asset
		# 	 
		attr_accessor :status
		# The parent id of the asset
		# 	 
		attr_accessor :parent_id
		# The Accuracy of the caption content
		# 	 
		attr_accessor :accuracy

		def caption_params_id=(val)
			@caption_params_id = val.to_i
		end
		def is_default=(val)
			@is_default = val.to_i
		end
		def status=(val)
			@status = val.to_i
		end
		def accuracy=(val)
			@accuracy = val.to_i
		end

		def from_xml(xml_element)
			super
			self.caption_params_id = xml_element.elements['captionParamsId'].text
			self.language = xml_element.elements['language'].text
			self.language_code = xml_element.elements['languageCode'].text
			self.is_default = xml_element.elements['isDefault'].text
			self.label = xml_element.elements['label'].text
			self.format = xml_element.elements['format'].text
			self.status = xml_element.elements['status'].text
			self.parent_id = xml_element.elements['parentId'].text
			self.accuracy = xml_element.elements['accuracy'].text
		end

	end

	class KalturaCaptionParams < KalturaAssetParams
		# The language of the caption content
		# 	 
		attr_accessor :language
		# Is default caption asset of the entry
		# 	 
		attr_accessor :is_default
		# Friendly label
		# 	 
		attr_accessor :label
		# The caption format
		# 	 
		attr_accessor :format
		# Id of the caption params or the flavor params to be used as source for the caption creation
		# 	 
		attr_accessor :source_params_id

		def is_default=(val)
			@is_default = val.to_i
		end
		def source_params_id=(val)
			@source_params_id = val.to_i
		end

		def from_xml(xml_element)
			super
			self.language = xml_element.elements['language'].text
			self.is_default = xml_element.elements['isDefault'].text
			self.label = xml_element.elements['label'].text
			self.format = xml_element.elements['format'].text
			self.source_params_id = xml_element.elements['sourceParamsId'].text
		end

	end

	class KalturaCaptionAssetListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaCaptionAsset')
		end

	end

	class KalturaCaptionParamsListResponse < KalturaListResponse
		attr_accessor :objects


		def from_xml(xml_element)
			super
			self.objects = KalturaClientBase.object_from_xml(xml_element.elements['objects'], 'KalturaCaptionParams')
		end

	end

	class KalturaParseMultiLanguageCaptionAssetJobData < KalturaJobData
		attr_accessor :multi_lanaguage_caption_asset_id
		attr_accessor :entry_id
		attr_accessor :file_location


		def from_xml(xml_element)
			super
			self.multi_lanaguage_caption_asset_id = xml_element.elements['multiLanaguageCaptionAssetId'].text
			self.entry_id = xml_element.elements['entryId'].text
			self.file_location = xml_element.elements['fileLocation'].text
		end

	end

	class KalturaCaptionAssetBaseFilter < KalturaAssetFilter
		attr_accessor :caption_params_id_equal
		attr_accessor :caption_params_id_in
		attr_accessor :format_equal
		attr_accessor :format_in
		attr_accessor :status_equal
		attr_accessor :status_in
		attr_accessor :status_not_in

		def caption_params_id_equal=(val)
			@caption_params_id_equal = val.to_i
		end
		def status_equal=(val)
			@status_equal = val.to_i
		end

		def from_xml(xml_element)
			super
			self.caption_params_id_equal = xml_element.elements['captionParamsIdEqual'].text
			self.caption_params_id_in = xml_element.elements['captionParamsIdIn'].text
			self.format_equal = xml_element.elements['formatEqual'].text
			self.format_in = xml_element.elements['formatIn'].text
			self.status_equal = xml_element.elements['statusEqual'].text
			self.status_in = xml_element.elements['statusIn'].text
			self.status_not_in = xml_element.elements['statusNotIn'].text
		end

	end

	class KalturaCaptionParamsBaseFilter < KalturaAssetParamsFilter
		attr_accessor :format_equal
		attr_accessor :format_in


		def from_xml(xml_element)
			super
			self.format_equal = xml_element.elements['formatEqual'].text
			self.format_in = xml_element.elements['formatIn'].text
		end

	end

	class KalturaCaptionAssetFilter < KalturaCaptionAssetBaseFilter


		def from_xml(xml_element)
			super
		end

	end

	class KalturaCaptionParamsFilter < KalturaCaptionParamsBaseFilter


		def from_xml(xml_element)
			super
		end

	end


	# Retrieve information and invoke actions on caption Asset
	#  
	class KalturaCaptionAssetService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Add caption asset
		#      
		def add(entry_id, caption_asset)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.add_param(kparams, 'captionAsset', caption_asset)
			client.queue_service_action_call('caption_captionasset', 'add', 'KalturaCaptionAsset', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update content of caption asset
		#      
		def set_content(id, content_resource)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kparams, 'contentResource', content_resource)
			client.queue_service_action_call('caption_captionasset', 'setContent', 'KalturaCaptionAsset', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update caption asset
		#      
		def update(id, caption_asset)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kparams, 'captionAsset', caption_asset)
			client.queue_service_action_call('caption_captionasset', 'update', 'KalturaCaptionAsset', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Serves caption by entry id and thumnail params id
		# 	 
		def serve_by_entry_id(entry_id, caption_param_id=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'entryId', entry_id)
			client.add_param(kparams, 'captionParamId', caption_param_id)
			client.queue_service_action_call('caption_captionasset', 'serveByEntryId', 'file', kparams)
			return client.get_serve_url()
		end

		# Get download URL for the asset
		# 	 
		def get_url(id, storage_id=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kparams, 'storageId', storage_id)
			client.queue_service_action_call('caption_captionasset', 'getUrl', 'string', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Get remote storage existing paths for the asset
		# 	 
		def get_remote_paths(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('caption_captionasset', 'getRemotePaths', 'KalturaRemotePathListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Serves caption by its id
		# 	 
		def serve(caption_asset_id)
			kparams = {}
			client.add_param(kparams, 'captionAssetId', caption_asset_id)
			client.queue_service_action_call('caption_captionasset', 'serve', 'file', kparams)
			return client.get_serve_url()
		end

		# Serves caption by its id converting it to segmented WebVTT
		# 	 
		def serve_web_vtt(caption_asset_id, segment_duration=30, segment_index=KalturaNotImplemented, local_timestamp=10000)
			kparams = {}
			client.add_param(kparams, 'captionAssetId', caption_asset_id)
			client.add_param(kparams, 'segmentDuration', segment_duration)
			client.add_param(kparams, 'segmentIndex', segment_index)
			client.add_param(kparams, 'localTimestamp', local_timestamp)
			client.queue_service_action_call('caption_captionasset', 'serveWebVTT', 'file', kparams)
			return client.get_serve_url()
		end

		# Markss the caption as default and removes that mark from all other caption assets of the entry.
		# 	 
		def set_as_default(caption_asset_id)
			kparams = {}
			client.add_param(kparams, 'captionAssetId', caption_asset_id)
			client.queue_service_action_call('caption_captionasset', 'setAsDefault', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		def get(caption_asset_id)
			kparams = {}
			client.add_param(kparams, 'captionAssetId', caption_asset_id)
			client.queue_service_action_call('caption_captionasset', 'get', 'KalturaCaptionAsset', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# List caption Assets by filter and pager
		# 	 
		def list(filter=KalturaNotImplemented, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('caption_captionasset', 'list', 'KalturaCaptionAssetListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		def delete(caption_asset_id)
			kparams = {}
			client.add_param(kparams, 'captionAssetId', caption_asset_id)
			client.queue_service_action_call('caption_captionasset', 'delete', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	# Add & Manage Caption Params
	#  
	class KalturaCaptionParamsService < KalturaServiceBase
		def initialize(client)
			super(client)
		end

		# Add new Caption Params
		# 	 
		def add(caption_params)
			kparams = {}
			client.add_param(kparams, 'captionParams', caption_params)
			client.queue_service_action_call('caption_captionparams', 'add', 'KalturaCaptionParams', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Get Caption Params by ID
		# 	 
		def get(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('caption_captionparams', 'get', 'KalturaCaptionParams', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Update Caption Params by ID
		# 	 
		def update(id, caption_params)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.add_param(kparams, 'captionParams', caption_params)
			client.queue_service_action_call('caption_captionparams', 'update', 'KalturaCaptionParams', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# Delete Caption Params by ID
		# 	 
		def delete(id)
			kparams = {}
			client.add_param(kparams, 'id', id)
			client.queue_service_action_call('caption_captionparams', 'delete', '', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end

		# List Caption Params by filter with paging support (By default - all system default params will be listed too)
		# 	 
		def list(filter=KalturaNotImplemented, pager=KalturaNotImplemented)
			kparams = {}
			client.add_param(kparams, 'filter', filter)
			client.add_param(kparams, 'pager', pager)
			client.queue_service_action_call('caption_captionparams', 'list', 'KalturaCaptionParamsListResponse', kparams)
			if (client.is_multirequest)
				return nil
			end
			return client.do_queue()
		end
	end

	class KalturaClient < KalturaClientBase
		attr_reader :caption_asset_service
		def caption_asset_service
			if (@caption_asset_service == nil)
				@caption_asset_service = KalturaCaptionAssetService.new(self)
			end
			return @caption_asset_service
		end
		
		attr_reader :caption_params_service
		def caption_params_service
			if (@caption_params_service == nil)
				@caption_params_service = KalturaCaptionParamsService.new(self)
			end
			return @caption_params_service
		end
		
	end

end
