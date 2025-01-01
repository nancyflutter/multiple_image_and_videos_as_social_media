class PassRestaurantDetailModel {
  String? restaurantId;
  String? restaurantName;
  String? restaurantImage;
  String? restaurantAddress;
  double? latRestaurant;
  double? lngRestaurant;
  String? restaurantDescription;
  String? termsAndConditions;
  int? isForm;

  PassRestaurantDetailModel({
     this.restaurantId,
     this.restaurantName,
     this.restaurantImage,
     this.restaurantAddress,
     this.latRestaurant,
     this.lngRestaurant,
     this.restaurantDescription,
     this.termsAndConditions,
     this.isForm,
  });
}
