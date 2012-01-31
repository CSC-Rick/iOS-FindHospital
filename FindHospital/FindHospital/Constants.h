//
//  Constants.h
//  FindHospital
//
//  Created by rickx on 1/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#ifndef FindHospital_Constants_h
#define FindHospital_Constants_h

static NSString *ServerUrl = @"http://tjv-nerd-iis7-2/Hospital/HospitalInfo.asmx/GetTopTenHospitalInfo";
static NSString *JsonQueryString = @"{manLongitude:%f,manLatitude:%f}";
static NSString *JsonContentType = @"application/json; charset=utf-8";
static NSString *HospitalKey = @"Hostpital";
static NSString *HospitalName = @"HospitalName";
static NSString *HospitalLongitude = @"HospitalLongitude";
static NSString *HospitalLatitude = @"HospitalLatitude";
static NSString *HospitalDistance = @"HospitalDistance";

static NSString *HospitalCellIdentifier = @"HospitalCellIdentifier";
static NSString *PositionStringFormat = @"%.1f\u00B0 , %.1f\u00B0";

static NSString *MapUrl = @"http://ditu.google.cn/maps?q=%f,%f";

static NSString *SectionName1 = @"Current position";
static NSString *SectionName2 = @"Search results";


#endif
