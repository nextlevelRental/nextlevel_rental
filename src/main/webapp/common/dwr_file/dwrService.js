if (typeof Activity != "function") {
  function Activity() {
    this.update_dt = null;
    this.due_time = null;
    this.cc_key = null;
    this.bcc_key = null;
    this.address_text = null;
    this.owner_user_nm = null;
    this.end_hour = null;
    this.appoint_end_dt = null;
    this.recipient_key = null;
    this.regarding_key = null;
    this.sender_nm = null;
    this.optional_nm = null;
    this.appoint_end_time = null;
    this.activity_type = null;
    this.duration_type = null;
    this.cc_nm = null;
    this.appoint_start_dt = null;
    this.subject_text = null;
    this.category_text = null;
    this.to_key = null;
    this.cc_type = null;
    this.bcc_nm = null;
    this.due_dt = null;
    this.tel_num = null;
    this.insert_dt = null;
    this.to_type = null;
    this.bcc_type = null;
    this.from_user_nm = null;
    this.sender_key = null;
    this.owner_user_id = null;
    this.to_nm = null;
    this.from_user_id = null;
    this.fax_num = null;
    this.sub_category_text = null;
    this.appoint_start_time = null;
    this.cover_page_type = null;
    this.sender_type = null;
    this.activity_seq = null;
    this.regarding_type = null;
    this.webmail_save_yn = null;
    this.minute = null;
    this.priority_type = null;
    this.start_minute = null;
    this.alarm_yn = null;
    this.required_key = null;
    this.direction_type = null;
    this.recipient_nm = null;
    this.required_type = null;
    this.activity_dt = null;
    this.regarding_nm = null;
    this.activity_note = null;
    this.hour = null;
    this.location_text = null;
    this.recipient_type = null;
    this.show_time_type = null;
    this.update_id = null;
    this.optional_type = null;
    this.required_nm = null;
    this.start_hour = null;
    this.end_minute = null;
    this.reqMap = null;
    this.optional_key = null;
    this.user = null;
    this.insert_id = null;
  }
}

// Provide a default path to dwr.engine
if (dwr == null) var dwr = {};
if (dwr.engine == null) dwr.engine = {};
if (DWREngine == null) var DWREngine = dwr.engine;

if (dwrService == null) var dwrService = {};
dwrService._path = '/dwr';
dwrService.selectActivityMainSchedule = function(p0, callback) {
	  dwr.engine._execute(dwrService._path, 'dwrService', 'selectActivityMainSchedule', p0, callback);
}
dwrService.updateBarcodePrint = function(p0, p1, callback) {
  dwr.engine._execute(dwrService._path, 'dwrService', 'updateBarcodePrint', p0, p1, callback);
}

