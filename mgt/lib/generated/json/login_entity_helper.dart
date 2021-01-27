import 'package:mgt/entities/base_entity.dart';
import 'package:mgt/entities/page_data.dart';
import 'package:mgt/entities/login_entity.dart';

baseEntityFromJson<T,S>(BaseEntity<T,S> data, Map<String, dynamic> json) {
	if (json['result'] != null) {
		data.result = json['result']?.toString();
	}
	if (json['message'] != null) {
		data.message = json['message']?.toString();
	}
	if (json['messagetype'] != null) {
		data.messagetype = json['messagetype']?.toString();
	}
	if (json['data'] != null) {
		data.data = json['data'];
	}
	if (json['pagedata'] != null) {
		data.pagedata = new PageData<T>().fromJson(json['pagedata']);
	}
	return data;
}

Map<String, dynamic> baseEntityToJson(BaseEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['result'] = entity.result;
	data['message'] = entity.message;
	data['messagetype'] = entity.messagetype;
	data['data'] = entity.data;
	if (entity.pagedata != null) {
		data['pagedata'] = entity.pagedata.toJson();
	}
	return data;
}

pageDataFromJson(PageData data, Map<String, dynamic> json) {
	if (json['total'] != null) {
		data.total = json['total']?.toInt();
	}
	if (json['data'] != null) {
		data.data = new List<LoginPagedataData>();
		(json['data'] as List).forEach((v) {
			data.data.add(new LoginPagedataData().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> pageDataToJson(PageData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['total'] = entity.total;
	if (entity.data != null) {
		data['data'] =  entity.data.map((v) => v.toJson()).toList();
	}
	return data;
}

loginDataFromJson(LoginPagedataData data, Map<String, dynamic> json) {
	if (json['isappraiser'] != null) {
		data.isappraiser = json['isappraiser']?.toString();
	}
	if (json['displayposition'] != null) {
		data.displayposition = json['displayposition']?.toString();
	}
	if (json['displayposition_en'] != null) {
		data.displaypositionEn = json['displayposition_en']?.toString();
	}
	if (json['accountname'] != null) {
		data.accountname = json['accountname']?.toString();
	}
	if (json['ishk'] != null) {
		data.ishk = json['ishk']?.toString();
	}
	if (json['isstarelite'] != null) {
		data.isstarelite = json['isstarelite']?.toString();
	}
	if (json['dealername'] != null) {
		data.dealername = json['dealername']?.toString();
	}
	if (json['dealername_en'] != null) {
		data.dealernameEn = json['dealername_en']?.toString();
	}
	if (json['scrole'] != null) {
		data.scrole = json['scrole']?.toString();
	}
	if (json['itaskversion'] != null) {
		data.itaskversion = json['itaskversion']?.toString();
	}
	if (json['forceupdate'] != null) {
		data.forceupdate = json['forceupdate']?.toString();
	}
	if (json['userauthority'] != null) {
		data.userauthority = json['userauthority']?.toString();
	}
	if (json['scrole_en'] != null) {
		data.scroleEn = json['scrole_en']?.toString();
	}
	if (json['sccode'] != null) {
		data.sccode = json['sccode']?.toString();
	}
	if (json['scname'] != null) {
		data.scname = json['scname']?.toString();
	}
	if (json['scphone'] != null) {
		data.scphone = json['scphone'];
	}
	if (json['scingroup'] != null) {
		data.scingroup = json['scingroup'];
	}
	if (json['scbrand'] != null) {
		data.scbrand = json['scbrand']?.toString();
	}
	if (json['sclevel'] != null) {
		data.sclevel = json['sclevel'];
	}
	if (json['scisreception'] != null) {
		data.scisreception = json['scisreception']?.toString();
	}
	if (json['todaytasknum'] != null) {
		data.todaytasknum = json['todaytasknum'];
	}
	if (json['recommendmonth'] != null) {
		data.recommendmonth = json['recommendmonth']?.toString();
	}
	if (json['maxreserveday'] != null) {
		data.maxreserveday = new List<dynamic>();
		data.maxreserveday.addAll(json['maxreserveday']);
	}
	if (json['decodephonenum'] != null) {
		data.decodephonenum = json['decodephonenum']?.toString();
	}
	if (json['upcode'] != null) {
		data.upcode = json['upcode']?.toString();
	}
	if (json['uprole'] != null) {
		data.uprole = json['uprole']?.toString();
	}
	if (json['firstlogin'] != null) {
		data.firstlogin = json['firstlogin']?.toString();
	}
	if (json['issap'] != null) {
		data.issap = json['issap']?.toString();
	}
	if (json['scheadpath'] != null) {
		data.scheadpath = json['scheadpath']?.toString();
	}
	if (json['dealercode'] != null) {
		data.dealercode = json['dealercode']?.toString();
	}
	if (json['info'] != null) {
		data.info = json['info']?.toString();
	}
	return data;
}

Map<String, dynamic> loginDataToJson(LoginPagedataData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['isappraiser'] = entity.isappraiser;
	data['displayposition'] = entity.displayposition;
	data['displayposition_en'] = entity.displaypositionEn;
	data['accountname'] = entity.accountname;
	data['ishk'] = entity.ishk;
	data['isstarelite'] = entity.isstarelite;
	data['dealername'] = entity.dealername;
	data['dealername_en'] = entity.dealernameEn;
	data['scrole'] = entity.scrole;
	data['itaskversion'] = entity.itaskversion;
	data['forceupdate'] = entity.forceupdate;
	data['userauthority'] = entity.userauthority;
	data['scrole_en'] = entity.scroleEn;
	data['sccode'] = entity.sccode;
	data['scname'] = entity.scname;
	data['scphone'] = entity.scphone;
	data['scingroup'] = entity.scingroup;
	data['scbrand'] = entity.scbrand;
	data['sclevel'] = entity.sclevel;
	data['scisreception'] = entity.scisreception;
	data['todaytasknum'] = entity.todaytasknum;
	data['recommendmonth'] = entity.recommendmonth;
	if (entity.maxreserveday != null) {
		data['maxreserveday'] =  [];
	}
	data['decodephonenum'] = entity.decodephonenum;
	data['upcode'] = entity.upcode;
	data['uprole'] = entity.uprole;
	data['firstlogin'] = entity.firstlogin;
	data['issap'] = entity.issap;
	data['scheadpath'] = entity.scheadpath;
	data['dealercode'] = entity.dealercode;
	data['info'] = entity.info;
	return data;
}