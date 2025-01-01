class PassRestaurantAvailabilityDetailModel {
  String? date;
  String? time;
  String? totalPerson;
  int? cab;
  String? pickUpAddress;
  String? pickUpLat;
  String? pickUpLng;
  int? returnCab;
  String? returnAddress;
  String? returnLat;
  String? returnLng;
  String? restaurantName;
  String? restaurantAddress;
  String? restaurantImage;
  String? restaurantId;
  String? startTime;
  double? latRestaurant;
  double? lngRestaurant;
  String? restaurantDescription;
  String? previousTotalAmount;
  String? isFrom;

  PassRestaurantAvailabilityDetailModel({
    this.date,
    this.time,
    this.totalPerson,
    this.cab,
    this.pickUpAddress,
    this.pickUpLat,
    this.pickUpLng,
    this.returnCab,
    this.returnAddress,
    this.returnLat,
    this.returnLng,
    this.restaurantName,
    this.restaurantAddress,
    this.restaurantImage,
    this.restaurantId,
    this.startTime,
    this.latRestaurant,
    this.lngRestaurant,
    this.restaurantDescription,
    this.previousTotalAmount,
    this.isFrom
  });
}
