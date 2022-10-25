import 'dart:typed_data';

import 'package:hive/hive.dart';

import '../../mobile_scanner.dart';

class BarcodeAdapter extends TypeAdapter<Barcode> {
  @override
  final int typeId = 0;

  @override
  Barcode read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Barcode()
      ..image = fields[0] as Uint8List?
      ..format =
          fields[1] == null ? BarcodeFormat.ean13 : fields[1] as BarcodeFormat?
      ..rawBytes = fields[2] as Uint8List?
      ..rawValue = fields[3] as String?
      ..displayValue = fields[4] as String?
      ..type = fields[5] == null ? BarcodeType.text : fields[5] as BarcodeType?
      ..calendarEvent = fields[6] as CalendarEvent?
      ..contactInfo = fields[7] as ContactInfo?
      ..driverLicense = fields[8] as DriverLicense?
      ..email = fields[9] as Email?
      ..geoPoint = fields[10] as GeoPoint?
      ..phone = fields[11] as Phone?
      ..sms = fields[12] as SMS?
      ..url = fields[13] as UrlBookmark?
      ..wifi = fields[14] as WiFi?;
  }

  @override
  void write(BinaryWriter writer, Barcode obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.image)
      ..writeByte(1)
      ..write(obj.format)
      ..writeByte(2)
      ..write(obj.rawBytes)
      ..writeByte(3)
      ..write(obj.rawValue)
      ..writeByte(4)
      ..write(obj.displayValue)
      ..writeByte(5)
      ..write(obj.type)
      ..writeByte(6)
      ..write(obj.calendarEvent)
      ..writeByte(7)
      ..write(obj.contactInfo)
      ..writeByte(8)
      ..write(obj.driverLicense)
      ..writeByte(9)
      ..write(obj.email)
      ..writeByte(10)
      ..write(obj.geoPoint)
      ..writeByte(11)
      ..write(obj.phone)
      ..writeByte(12)
      ..write(obj.sms)
      ..writeByte(13)
      ..write(obj.url)
      ..writeByte(14)
      ..write(obj.wifi);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BarcodeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CalendarEventAdapter extends TypeAdapter<CalendarEvent> {
  @override
  final int typeId = 1;

  @override
  CalendarEvent read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CalendarEvent()
      ..description = fields[0] as String?
      ..start = fields[1] as DateTime?
      ..end = fields[2] as DateTime?
      ..location = fields[3] as String?
      ..organizer = fields[4] as String?
      ..status = fields[5] as String?
      ..summary = fields[6] as String?;
  }

  @override
  void write(BinaryWriter writer, CalendarEvent obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.description)
      ..writeByte(1)
      ..write(obj.start)
      ..writeByte(2)
      ..write(obj.end)
      ..writeByte(3)
      ..write(obj.location)
      ..writeByte(4)
      ..write(obj.organizer)
      ..writeByte(5)
      ..write(obj.status)
      ..writeByte(6)
      ..write(obj.summary);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CalendarEventAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ContactInfoAdapter extends TypeAdapter<ContactInfo> {
  @override
  final int typeId = 2;

  @override
  ContactInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ContactInfo()
      ..addresses = (fields[0] as List).cast<Address>()
      ..emails = (fields[1] as List).cast<Email>()
      ..name = fields[2] as PersonName?
      ..organization = fields[3] as String?
      ..phones = (fields[4] as List?)?.cast<Phone>()
      ..title = fields[5] as String?
      ..urls = (fields[6] as List?)?.cast<String>();
  }

  @override
  void write(BinaryWriter writer, ContactInfo obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.addresses)
      ..writeByte(1)
      ..write(obj.emails)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.organization)
      ..writeByte(4)
      ..write(obj.phones)
      ..writeByte(5)
      ..write(obj.title)
      ..writeByte(6)
      ..write(obj.urls);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ContactInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AddressAdapter extends TypeAdapter<Address> {
  @override
  final int typeId = 3;

  @override
  Address read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Address()
      ..addressLines =
          fields[0] == null ? [] : (fields[0] as List).cast<String>()
      ..type = fields[1] as AddressType?;
  }

  @override
  void write(BinaryWriter writer, Address obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.addressLines)
      ..writeByte(1)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddressAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PersonNameAdapter extends TypeAdapter<PersonName> {
  @override
  final int typeId = 4;

  @override
  PersonName read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PersonName()
      ..first = fields[0] as String?
      ..middle = fields[1] as String?
      ..last = fields[2] as String?
      ..prefix = fields[3] as String?
      ..suffix = fields[4] as String?
      ..formattedName = fields[5] as String?
      ..pronunciation = fields[6] as String?;
  }

  @override
  void write(BinaryWriter writer, PersonName obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.first)
      ..writeByte(1)
      ..write(obj.middle)
      ..writeByte(2)
      ..write(obj.last)
      ..writeByte(3)
      ..write(obj.prefix)
      ..writeByte(4)
      ..write(obj.suffix)
      ..writeByte(5)
      ..write(obj.formattedName)
      ..writeByte(6)
      ..write(obj.pronunciation);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PersonNameAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DriverLicenseAdapter extends TypeAdapter<DriverLicense> {
  @override
  final int typeId = 5;

  @override
  DriverLicense read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DriverLicense()
      ..addressCity = fields[0] as String?
      ..addressState = fields[1] as String?
      ..addressStreet = fields[2] as String?
      ..addressZip = fields[3] as String?
      ..birthDate = fields[4] as String?
      ..documentType = fields[5] as String?
      ..expiryDate = fields[6] as String?
      ..firstName = fields[7] as String?
      ..gender = fields[8] as String?
      ..issueDate = fields[9] as String?
      ..issuingCountry = fields[10] as String?
      ..lastName = fields[11] as String?
      ..licenseNumber = fields[12] as String?
      ..middleName = fields[13] as String?;
  }

  @override
  void write(BinaryWriter writer, DriverLicense obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.addressCity)
      ..writeByte(1)
      ..write(obj.addressState)
      ..writeByte(2)
      ..write(obj.addressStreet)
      ..writeByte(3)
      ..write(obj.addressZip)
      ..writeByte(4)
      ..write(obj.birthDate)
      ..writeByte(5)
      ..write(obj.documentType)
      ..writeByte(6)
      ..write(obj.expiryDate)
      ..writeByte(7)
      ..write(obj.firstName)
      ..writeByte(8)
      ..write(obj.gender)
      ..writeByte(9)
      ..write(obj.issueDate)
      ..writeByte(10)
      ..write(obj.issuingCountry)
      ..writeByte(11)
      ..write(obj.lastName)
      ..writeByte(12)
      ..write(obj.licenseNumber)
      ..writeByte(13)
      ..write(obj.middleName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DriverLicenseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class EmailAdapter extends TypeAdapter<Email> {
  @override
  final int typeId = 6;

  @override
  Email read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Email()
      ..address = fields[0] as String?
      ..body = fields[1] as String?
      ..subject = fields[2] as String?
      ..type = fields[3] as EmailType?;
  }

  @override
  void write(BinaryWriter writer, Email obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.address)
      ..writeByte(1)
      ..write(obj.body)
      ..writeByte(2)
      ..write(obj.subject)
      ..writeByte(3)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EmailAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class GeoPointAdapter extends TypeAdapter<GeoPoint> {
  @override
  final int typeId = 7;

  @override
  GeoPoint read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GeoPoint()
      ..latitude = fields[0] as double?
      ..longitude = fields[1] as double?;
  }

  @override
  void write(BinaryWriter writer, GeoPoint obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.latitude)
      ..writeByte(1)
      ..write(obj.longitude);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GeoPointAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PhoneAdapter extends TypeAdapter<Phone> {
  @override
  final int typeId = 8;

  @override
  Phone read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Phone()
      ..number = fields[0] as String?
      ..type = fields[1] as PhoneType?;
  }

  @override
  void write(BinaryWriter writer, Phone obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.number)
      ..writeByte(1)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PhoneAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SMSAdapter extends TypeAdapter<SMS> {
  @override
  final int typeId = 9;

  @override
  SMS read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SMS()
      ..message = fields[0] as String?
      ..phoneNumber = fields[1] as String?;
  }

  @override
  void write(BinaryWriter writer, SMS obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.message)
      ..writeByte(1)
      ..write(obj.phoneNumber);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SMSAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UrlBookmarkAdapter extends TypeAdapter<UrlBookmark> {
  @override
  final int typeId = 10;

  @override
  UrlBookmark read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UrlBookmark()
      ..title = fields[0] as String?
      ..url = fields[1] as String?;
  }

  @override
  void write(BinaryWriter writer, UrlBookmark obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.url);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UrlBookmarkAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class WiFiAdapter extends TypeAdapter<WiFi> {
  @override
  final int typeId = 11;

  @override
  WiFi read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WiFi()
      ..encryptionType = fields[0] as EncryptionType?
      ..ssid = fields[1] as String?
      ..password = fields[2] as String?;
  }

  @override
  void write(BinaryWriter writer, WiFi obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.encryptionType)
      ..writeByte(1)
      ..write(obj.ssid)
      ..writeByte(2)
      ..write(obj.password);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WiFiAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class BarcodeFormatAdapter extends TypeAdapter<BarcodeFormat> {
  @override
  final int typeId = 12;

  @override
  BarcodeFormat read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return BarcodeFormat.unknown;
      case 1:
        return BarcodeFormat.all;
      case 2:
        return BarcodeFormat.code128;
      case 3:
        return BarcodeFormat.code39;
      case 4:
        return BarcodeFormat.code93;
      case 5:
        return BarcodeFormat.codebar;
      case 6:
        return BarcodeFormat.dataMatrix;
      case 7:
        return BarcodeFormat.ean13;
      case 8:
        return BarcodeFormat.ean8;
      case 9:
        return BarcodeFormat.itf;
      case 10:
        return BarcodeFormat.qrCode;
      case 11:
        return BarcodeFormat.upcA;
      case 12:
        return BarcodeFormat.upcE;
      case 13:
        return BarcodeFormat.pdf417;
      case 14:
        return BarcodeFormat.aztec;
      default:
        return BarcodeFormat.unknown;
    }
  }

  @override
  void write(BinaryWriter writer, BarcodeFormat obj) {
    switch (obj) {
      case BarcodeFormat.unknown:
        writer.writeByte(0);
        break;
      case BarcodeFormat.all:
        writer.writeByte(1);
        break;
      case BarcodeFormat.code128:
        writer.writeByte(2);
        break;
      case BarcodeFormat.code39:
        writer.writeByte(3);
        break;
      case BarcodeFormat.code93:
        writer.writeByte(4);
        break;
      case BarcodeFormat.codebar:
        writer.writeByte(5);
        break;
      case BarcodeFormat.dataMatrix:
        writer.writeByte(6);
        break;
      case BarcodeFormat.ean13:
        writer.writeByte(7);
        break;
      case BarcodeFormat.ean8:
        writer.writeByte(8);
        break;
      case BarcodeFormat.itf:
        writer.writeByte(9);
        break;
      case BarcodeFormat.qrCode:
        writer.writeByte(10);
        break;
      case BarcodeFormat.upcA:
        writer.writeByte(11);
        break;
      case BarcodeFormat.upcE:
        writer.writeByte(12);
        break;
      case BarcodeFormat.pdf417:
        writer.writeByte(13);
        break;
      case BarcodeFormat.aztec:
        writer.writeByte(14);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BarcodeFormatAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AddressTypeAdapter extends TypeAdapter<AddressType> {
  @override
  final int typeId = 13;

  @override
  AddressType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return AddressType.unknown;
      case 1:
        return AddressType.work;
      case 2:
        return AddressType.home;
      default:
        return AddressType.unknown;
    }
  }

  @override
  void write(BinaryWriter writer, AddressType obj) {
    switch (obj) {
      case AddressType.unknown:
        writer.writeByte(0);
        break;
      case AddressType.work:
        writer.writeByte(1);
        break;
      case AddressType.home:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddressTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class BarcodeTypeAdapter extends TypeAdapter<BarcodeType> {
  @override
  final int typeId = 14;

  @override
  BarcodeType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return BarcodeType.unknown;
      case 1:
        return BarcodeType.contactInfo;
      case 2:
        return BarcodeType.email;
      case 3:
        return BarcodeType.isbn;
      case 4:
        return BarcodeType.phone;
      case 5:
        return BarcodeType.product;
      case 6:
        return BarcodeType.sms;
      case 7:
        return BarcodeType.text;
      case 8:
        return BarcodeType.url;
      case 9:
        return BarcodeType.wifi;
      case 10:
        return BarcodeType.geo;
      case 11:
        return BarcodeType.calendarEvent;
      case 12:
        return BarcodeType.driverLicense;
      default:
        return BarcodeType.unknown;
    }
  }

  @override
  void write(BinaryWriter writer, BarcodeType obj) {
    switch (obj) {
      case BarcodeType.unknown:
        writer.writeByte(0);
        break;
      case BarcodeType.contactInfo:
        writer.writeByte(1);
        break;
      case BarcodeType.email:
        writer.writeByte(2);
        break;
      case BarcodeType.isbn:
        writer.writeByte(3);
        break;
      case BarcodeType.phone:
        writer.writeByte(4);
        break;
      case BarcodeType.product:
        writer.writeByte(5);
        break;
      case BarcodeType.sms:
        writer.writeByte(6);
        break;
      case BarcodeType.text:
        writer.writeByte(7);
        break;
      case BarcodeType.url:
        writer.writeByte(8);
        break;
      case BarcodeType.wifi:
        writer.writeByte(9);
        break;
      case BarcodeType.geo:
        writer.writeByte(10);
        break;
      case BarcodeType.calendarEvent:
        writer.writeByte(11);
        break;
      case BarcodeType.driverLicense:
        writer.writeByte(12);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BarcodeTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class EmailTypeAdapter extends TypeAdapter<EmailType> {
  @override
  final int typeId = 15;

  @override
  EmailType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return EmailType.unknown;
      case 1:
        return EmailType.work;
      case 2:
        return EmailType.home;
      default:
        return EmailType.unknown;
    }
  }

  @override
  void write(BinaryWriter writer, EmailType obj) {
    switch (obj) {
      case EmailType.unknown:
        writer.writeByte(0);
        break;
      case EmailType.work:
        writer.writeByte(1);
        break;
      case EmailType.home:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EmailTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PhoneTypeAdapter extends TypeAdapter<PhoneType> {
  @override
  final int typeId = 16;

  @override
  PhoneType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return PhoneType.unknown;
      case 1:
        return PhoneType.work;
      case 2:
        return PhoneType.home;
      case 3:
        return PhoneType.fax;
      case 4:
        return PhoneType.mobile;
      default:
        return PhoneType.unknown;
    }
  }

  @override
  void write(BinaryWriter writer, PhoneType obj) {
    switch (obj) {
      case PhoneType.unknown:
        writer.writeByte(0);
        break;
      case PhoneType.work:
        writer.writeByte(1);
        break;
      case PhoneType.home:
        writer.writeByte(2);
        break;
      case PhoneType.fax:
        writer.writeByte(3);
        break;
      case PhoneType.mobile:
        writer.writeByte(4);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PhoneTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class EncryptionTypeAdapter extends TypeAdapter<EncryptionType> {
  @override
  final int typeId = 17;

  @override
  EncryptionType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return EncryptionType.none;
      case 1:
        return EncryptionType.open;
      case 2:
        return EncryptionType.wpa;
      case 3:
        return EncryptionType.wep;
      default:
        return EncryptionType.none;
    }
  }

  @override
  void write(BinaryWriter writer, EncryptionType obj) {
    switch (obj) {
      case EncryptionType.none:
        writer.writeByte(0);
        break;
      case EncryptionType.open:
        writer.writeByte(1);
        break;
      case EncryptionType.wpa:
        writer.writeByte(2);
        break;
      case EncryptionType.wep:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EncryptionTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
