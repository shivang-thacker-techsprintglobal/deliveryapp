class S {
  static bool _isArabic = true;
  static void setArabic(bool value) => _isArabic = value;

  static String get appTitle => _isArabic ? 'لوحة الإدارة' : 'Admin Dashboard';
  static String get admin => _isArabic ? 'المسؤول' : 'Admin';
  static String get adminEmail => 'admin@app.com';

  static String get home => _isArabic ? 'الرئيسية' : 'Home';
  static String get categories => _isArabic ? 'الأقسام' : 'Categories';
  static String get users => _isArabic ? 'المستخدمين' : 'Users';
  static String get orders => _isArabic ? 'الطلبات' : 'Orders';
  static String get drivers => _isArabic ? 'السائقين' : 'Drivers';
  static String get restaurants => _isArabic ? 'المطاعم' : 'Restaurants';
  static String get offers => _isArabic ? 'العروض' : 'Offers';
  static String get dashboardSub =>
      _isArabic ? 'Admin Dashboard' : 'Admin Dashboard';
  static String get settings => _isArabic ? 'الإعدادات' : 'Settings';
  static String get language => _isArabic ? 'اللغة' : 'Language';
  static String get darkMode => _isArabic ? 'الوضع الداكن' : 'Dark Mode';
  static String get arabic => _isArabic ? 'عربي' : 'Arabic';
  static String get english => _isArabic ? 'إنجليزي' : 'English';

  static String get welcomeMsg => _isArabic ? 'مرحباً بك' : 'Welcome';
  static String get overviewMsg => _isArabic
      ? 'إليك نظرة عامة على النظام اليوم'
      : 'Here\'s an overview of your system today';
  static String get totalUsers =>
      _isArabic ? 'إجمالي المستخدمين' : 'Total Users';
  static String get availableCategories =>
      _isArabic ? 'الأقسام المتاحة' : 'Available Categories';
  static String get totalOrders =>
      _isArabic ? 'إجمالي الطلبات' : 'Total Orders';
  static String get totalRevenue =>
      _isArabic ? 'إجمالي الإيرادات' : 'Total Revenue';
  static String get ordersActivity =>
      _isArabic ? 'نشاط الطلبات' : 'Orders Activity';
  static String get last7Days => _isArabic ? 'آخر 7 أيام' : 'Last 7 days';
  static String get orderStatusDist =>
      _isArabic ? 'توزيع حالات الطلبات' : 'Order Status Distribution';
  static String get recentOrders => _isArabic ? 'آخر الطلبات' : 'Recent Orders';
  static String get viewAll => _isArabic ? 'عرض الكل ←' : 'View All →';
  static String get noData => _isArabic ? 'لا توجد بيانات' : 'No data';
  static String get noOrdersYet =>
      _isArabic ? 'لا يوجد طلبات حتى الآن' : 'No orders yet';
  static String get categoryAnalytics =>
      _isArabic ? 'إحصائيات الأقسام' : 'Category Analytics';

  static List<String> get weekDays => _isArabic
      ? ['سبت', 'أحد', 'إثنين', 'ثلاثاء', 'أربعاء', 'خميس', 'جمعة']
      : ['Sat', 'Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri'];

  static String get pending => _isArabic ? 'قيد المعالجة' : 'Pending';
  static String get completed => _isArabic ? 'مكتمل' : 'Completed';
  static String get delivering => _isArabic ? 'قيد التوصيل' : 'Delivering';
  static String get cancelled => _isArabic ? 'ملغي' : 'Cancelled';
  static String get all => _isArabic ? 'الكل' : 'All';

  static String get manageCategories =>
      _isArabic ? 'إدارة الأقسام' : 'Manage Categories';
  static String get manageCategoriesSub => _isArabic
      ? 'إضافة وتعديل وحذف الأقسام'
      : 'Add, edit and delete categories';
  static String get addCategory => _isArabic ? 'إضافة قسم' : 'Add Category';
  static String get editCategory => _isArabic ? 'تعديل القسم' : 'Edit Category';
  static String get addNewCategory =>
      _isArabic ? 'إضافة قسم جديد' : 'Add New Category';
  static String get categoryName => _isArabic ? 'اسم القسم' : 'Category Name';
  static String get description => _isArabic ? 'الوصف' : 'Description';
  static String get noCategoriesYet =>
      _isArabic ? 'لا توجد أقسام بعد' : 'No categories yet';
  static String get addCategoryHint => _isArabic
      ? 'اضغط على "إضافة قسم" لإنشاء قسم جديد'
      : 'Press "Add Category" to create a new one';

  static String get manageUsers =>
      _isArabic ? 'إدارة المستخدمين' : 'Manage Users';
  static String get manageUsersSub => _isArabic
      ? 'عرض وإدارة حسابات المستخدمين'
      : 'View and manage user accounts';
  static String get noUsersYet =>
      _isArabic ? 'لا يوجد مستخدمين حالياً' : 'No users yet';
  static String get active => _isArabic ? 'نشط' : 'Active';
  static String get disabled => _isArabic ? 'معطل' : 'Disabled';
  static String get disable => _isArabic ? 'تعطيل' : 'Disable';
  static String get enable => _isArabic ? 'تفعيل' : 'Enable';

  static String get manageOrders =>
      _isArabic ? 'إدارة الطلبات' : 'Manage Orders';
  static String get manageOrdersSub => _isArabic
      ? 'متابعة وتحديث حالات الطلبات'
      : 'Track and update order statuses';
  static String get noOrdersNow =>
      _isArabic ? 'لا يوجد طلبات حالياً' : 'No orders right now';
  static String get searchOrders =>
      _isArabic ? 'بحث برقم الطلب...' : 'Search by order ID...';

  static String get meals => _isArabic ? 'الوجبات' : 'Meals';
  static String get addMeal => _isArabic ? 'إضافة وجبة' : 'Add Meal';
  static String get editMeal => _isArabic ? 'تعديل الوجبة' : 'Edit Meal';
  static String get mealName => _isArabic ? 'اسم الوجبة' : 'Meal Name';
  static String get mealNameAr =>
      _isArabic ? 'اسم الوجبة (عربي)' : 'Meal Name (AR)';
  static String get mealPrice => _isArabic ? 'السعر' : 'Price';
  static String get available => _isArabic ? 'متاح' : 'Available';
  static String get unavailable => _isArabic ? 'غير متاح' : 'Unavailable';
  static String get noMealsYet =>
      _isArabic ? 'لا توجد وجبات بعد' : 'No meals yet';
  static String get addMealHint => _isArabic
      ? 'اضغط على "إضافة وجبة" لإنشاء وجبة جديدة'
      : 'Press "Add Meal" to create a new one';

  static String get categoryDetails =>
      _isArabic ? 'تفاصيل القسم' : 'Category Details';
  static String get backToCategories =>
      _isArabic ? 'العودة للأقسام' : 'Back to Categories';
  static String get mealsCount => _isArabic ? 'عدد الوجبات' : 'Meals';
  static String get completedOrders =>
      _isArabic ? 'الطلبات المكتملة' : 'Completed Orders';
  static String get revenue => _isArabic ? 'الإيرادات' : 'Revenue';
  static String get viewDetails => _isArabic ? 'عرض' : 'View';

  static String get search => _isArabic ? 'بحث...' : 'Search...';
  static String get edit => _isArabic ? 'تعديل' : 'Edit';
  static String get delete => _isArabic ? 'حذف' : 'Delete';
  static String get cancel => _isArabic ? 'إلغاء' : 'Cancel';
  static String get save => _isArabic ? 'حفظ' : 'Save';
  static String get add => _isArabic ? 'إضافة' : 'Add';
  static String get confirmDelete =>
      _isArabic ? 'تأكيد الحذف' : 'Confirm Delete';
  static String get successAdd =>
      _isArabic ? 'تم الإضافة بنجاح' : 'Added successfully';
  static String get successEdit =>
      _isArabic ? 'تم التعديل بنجاح' : 'Updated successfully';
  static String get successDelete =>
      _isArabic ? 'تم الحذف بنجاح' : 'Deleted successfully';
  static String get successStatus =>
      _isArabic ? 'تم تحديث الحالة بنجاح' : 'Status updated successfully';
  static String get errorOccurred =>
      _isArabic ? 'حدث خطأ أثناء العملية' : 'An error occurred';
  static String get loadError =>
      _isArabic ? 'حدث خطأ في تحميل البيانات' : 'Error loading data';

  static String orderNum(String id) => _isArabic ? 'طلب #$id' : 'Order #$id';
  static String deleteConfirmMsg(String name) => _isArabic
      ? 'هل أنت متأكد من حذف "$name"؟'
      : 'Are you sure you want to delete "$name"?';
  static String deleteOrderMsg(String id) =>
      _isArabic ? 'حذف الطلب #$id؟' : 'Delete order #$id?';
  static String deleteUserMsg(String name) =>
      _isArabic ? 'حذف المستخدم "$name"؟' : 'Delete user "$name"?';
  static String deleteMealMsg(String name) =>
      _isArabic ? 'حذف الوجبة "$name"؟' : 'Delete meal "$name"?';
  static String userLabel(String id) =>
      _isArabic ? 'المستخدم: $id' : 'User: $id';
  static String get searchInCategories =>
      _isArabic ? 'بحث في الأقسام...' : 'Search categories...';
  static String get searchUsers =>
      _isArabic ? 'بحث بالاسم أو الإيميل...' : 'Search by name or email...';
  static String get searchMeals =>
      _isArabic ? 'بحث في الوجبات...' : 'Search meals...';

  static String get userStats =>
      _isArabic ? 'إحصائيات المستخدم' : 'User Statistics';
  static String get totalOrdersUser =>
      _isArabic ? 'إجمالي الطلبات' : 'Total Orders';
  static String get cancelledOrdersUser =>
      _isArabic ? 'الطلبات الملغية' : 'Cancelled Orders';
  static String get completedOrdersUser =>
      _isArabic ? 'الطلبات المكتملة' : 'Completed Orders';
  static String get pendingOrdersUser =>
      _isArabic ? 'طلبات قيد التنفيذ' : 'Pending Orders';
  static String get totalSpent =>
      _isArabic ? 'إجمالي المصروفات' : 'Total Spent';
  static String get close => _isArabic ? 'إغلاق' : 'Close';
  static String get loadingStats =>
      _isArabic ? 'جاري تحميل الإحصائيات...' : 'Loading statistics...';

  static String get refresh => _isArabic ? 'تحديث' : 'Refresh';
  static String get refreshing =>
      _isArabic ? 'جاري التحديث...' : 'Refreshing...';
  static String get latestUsers =>
      _isArabic ? 'أحدث المستخدمين' : 'Latest Users';
  static String get statistics => _isArabic ? 'الإحصائيات' : 'Statistics';
  static String get actions => _isArabic ? 'الإجراءات' : 'Actions';
  static String get user => _isArabic ? 'المستخدم' : 'User';
  static String get joinedDate =>
      _isArabic ? 'تاريخ الانضمام' : 'Joined date';
  static String get phone => _isArabic ? 'رقم الهاتف' : 'Phone';
  static String get customer => _isArabic ? 'العميل' : 'Customer';
  static String get status => _isArabic ? 'الحالة' : 'Status';
  static String get total => _isArabic ? 'الإجمالي' : 'Total';
  static String get date => _isArabic ? 'التاريخ' : 'Date';
  static String get items => _isArabic ? 'الأصناف' : 'Items';
  static String get orderId => _isArabic ? 'رقم الطلب' : 'Order ID';
  static String itemsCount(int n) =>
      _isArabic ? '$n صنف' : (n == 1 ? '1 item' : '$n items');

  static String get categoryNameEn =>
      _isArabic ? 'اسم القسم (EN)' : 'Category name (EN)';
  static String get categoryNameAr =>
      _isArabic ? 'اسم القسم (AR)' : 'Category name (AR)';
  static String get descriptionEn =>
      _isArabic ? 'الوصف (EN)' : 'Description (EN)';
  static String get descriptionAr =>
      _isArabic ? 'الوصف (AR)' : 'Description (AR)';
  static String get categoryImage =>
      _isArabic ? 'صورة القسم' : 'Category image';
  static String get noDescription =>
      _isArabic ? 'لا يوجد وصف' : 'No description';
  static String get categoryCol => _isArabic ? 'القسم' : 'Category';

  static String get manageDrivers =>
      _isArabic ? 'إدارة السائقين' : 'Manage Drivers';
  static String get manageDriversSub => _isArabic
      ? 'عرض وإدارة واعتماد حسابات السائقين'
      : 'View, manage and approve driver accounts';
  static String get searchDrivers => _isArabic
      ? 'بحث بالاسم أو الإيميل أو الهاتف...'
      : 'Search by name, email or phone...';
  static String get noDriversYet =>
      _isArabic ? 'لا يوجد سائقين حتى الآن' : 'No drivers yet';
  static String get driver => _isArabic ? 'السائق' : 'Driver';
  static String get connectionStatus =>
      _isArabic ? 'حالة الاتصال' : 'Connection';
  static String get approval => _isArabic ? 'الاعتماد' : 'Approval';
  static String get noName => _isArabic ? 'بدون اسم' : 'No name';
  static String get noEmail => _isArabic ? 'لا يوجد بريد' : 'No email';
  static String get online => _isArabic ? 'متصل' : 'Online';
  static String get offline => _isArabic ? 'غير متصل' : 'Offline';
  static String get approved => _isArabic ? 'معتمد' : 'Approved';
  static String get notApproved => _isArabic ? 'غير معتمد' : 'Not Approved';

  static String get manageRestaurants =>
      _isArabic ? 'إدارة المطاعم' : 'Manage Restaurants';
  static String get manageRestaurantsSub => _isArabic
      ? 'عرض وإدارة المطاعم المشاركة'
      : 'View and manage partner restaurants';
  static String get searchByName =>
      _isArabic ? 'بحث بالاسم...' : 'Search by name...';
  static String get addRestaurant =>
      _isArabic ? 'إضافة مطعم' : 'Add Restaurant';
  static String get manageBranches =>
      _isArabic ? 'إدارة الفروع' : 'Manage Branches';
  static String get addBranch => _isArabic ? 'إضافة فرع' : 'Add Branch';
  static String get branchNameEn =>
      _isArabic ? 'اسم الفرع (EN)' : 'Branch name (EN)';
  static String get branchNameAr =>
      _isArabic ? 'اسم الفرع (AR)' : 'Branch name (AR)';
  static String get open => _isArabic ? 'مفتوح' : 'Open';
  static String get closed => _isArabic ? 'مغلق' : 'Closed';
  static String get restaurantName =>
      _isArabic ? 'اسم المطعم' : 'Restaurant name';
  static String get mainPhone =>
      _isArabic ? 'رقم الهاتف (الرئيسي)' : 'Phone (main)';
  static String get mainAddress =>
      _isArabic ? 'العنوان (الرئيسي)' : 'Address (main)';
  static String get restaurantImage =>
      _isArabic ? 'صورة المطعم' : 'Restaurant image';
  static String get noRestaurantsYet =>
      _isArabic ? 'لا توجد مطاعم حتى الآن' : 'No restaurants yet';
  static String get restaurant => _isArabic ? 'المطعم' : 'Restaurant';
  static String get branchesCount =>
      _isArabic ? 'عدد الفروع' : 'Branches';
  static String branchesCountN(int n) =>
      _isArabic ? '$n فروع' : (n == 1 ? '1 branch' : '$n branches');
  static String get noBranchesYet =>
      _isArabic ? 'لا توجد فروع مسجلة حتى الآن' : 'No branches yet';
  static String statusWithValue(String v) =>
      _isArabic ? 'الحالة: $v' : 'Status: $v';
  static String get addNewBranch =>
      _isArabic ? 'إضافة فرع جديد' : 'Add new branch';
  static String get editBranch =>
      _isArabic ? 'تعديل الفرع' : 'Edit branch';
  static String get editRestaurant =>
      _isArabic ? 'تعديل المطعم' : 'Edit restaurant';
  static String deleteBranchMsg(String name) => _isArabic
      ? 'هل أنت متأكد من حذف فرع "$name"؟'
      : 'Are you sure you want to delete branch "$name"?';
  static String deleteRestaurantMsg(String name) => _isArabic
      ? 'هل أنت متأكد من حذف المطعم $name وجميع فروعه؟'
      : 'Are you sure you want to delete restaurant $name and all its branches?';

  static String get manageOffers =>
      _isArabic ? 'إدارة العروض' : 'Manage Offers';
  static String get manageOffersSub => _isArabic
      ? 'عرض وإدارة العروض والخصومات'
      : 'View and manage offers and discounts';
  static String get searchOffers =>
      _isArabic ? 'بحث في العروض...' : 'Search offers...';
  static String get addOffer => _isArabic ? 'إضافة عرض' : 'Add Offer';
  static String get offerTitle =>
      _isArabic ? 'معرف أو عنوان داخلي' : 'Internal title / ID';
  static String get discountPercent =>
      _isArabic ? 'نسبة الخصم (%)' : 'Discount (%)';
  static String get lineOneEn =>
      _isArabic ? 'السطر الأول (EN)' : 'Line 1 (EN)';
  static String get lineOneAr =>
      _isArabic ? 'السطر الأول (AR)' : 'Line 1 (AR)';
  static String get lineTwoEn =>
      _isArabic ? 'السطر الثاني (EN)' : 'Line 2 (EN)';
  static String get lineTwoAr =>
      _isArabic ? 'السطر الثاني (AR)' : 'Line 2 (AR)';
  static String get timeEn => _isArabic ? 'الوقت (EN)' : 'Time (EN)';
  static String get timeAr => _isArabic ? 'الوقت (AR)' : 'Time (AR)';
  static String get offerBgImage =>
      _isArabic ? 'صورة خلفية العرض' : 'Offer background image';
  static String get sectionActive =>
      _isArabic ? 'القسم نشط' : 'Section active';
  static String get calendarTimer =>
      _isArabic ? 'مؤقت التقويم' : 'Calendar timer';
  static String get noOffersYet =>
      _isArabic ? 'لا توجد أقسام عروض حتى الآن' : 'No offers yet';
  static String get offer => _isArabic ? 'العرض' : 'Offer';
  static String get inactive => _isArabic ? 'غير نشط' : 'Inactive';
  static String get addOfferSection =>
      _isArabic ? 'إضافة قسم عرض' : 'Add offer section';
  static String get editOfferSection =>
      _isArabic ? 'تعديل قسم العرض' : 'Edit offer section';
  static String deleteOfferMsg(String title) => _isArabic
      ? 'هل أنت متأكد من حذف العرض $title؟'
      : 'Are you sure you want to delete offer $title?';

  static String get mealImage =>
      _isArabic ? 'صورة الصنف' : 'Meal image';
  static String get offerSection =>
      _isArabic ? 'قسم العرض' : 'Offer section';
  static String get sectionInfo =>
      _isArabic ? 'معلومات القسم' : 'Section info';
  static String get lineOneColon =>
      _isArabic ? 'السطر الأول:' : 'Line 1:';
  static String get lineTwoColon =>
      _isArabic ? 'السطر الثاني:' : 'Line 2:';
  static String get timeColon => _isArabic ? 'الوقت:' : 'Time:';
  static String get discountColon =>
      _isArabic ? 'الخصم:' : 'Discount:';
  static String get offerItems =>
      _isArabic ? 'عناصر العرض' : 'Offer items';
  static String get addItem => _isArabic ? 'إضافة عنصر' : 'Add item';
  static String get noOfferItems =>
      _isArabic ? 'لا توجد عناصر مضافة' : 'No items added';
  static String get addOfferItem =>
      _isArabic ? 'إضافة عنصر للعرض' : 'Add offer item';
  static String get editItem => _isArabic ? 'تعديل العنصر' : 'Edit item';
  static String get itemNameEn =>
      _isArabic ? 'اسم العنصر (EN)' : 'Item name (EN)';
  static String get itemNameAr =>
      _isArabic ? 'اسم العنصر (AR)' : 'Item name (AR)';
  static String get priceAfterDiscount =>
      _isArabic ? 'السعر بعد الخصم (EGP)' : 'Price after discount (EGP)';
  static String get itemImage =>
      _isArabic ? 'صورة العنصر' : 'Item image';
  static String deleteItemMsg(String name) => _isArabic
      ? 'هل أنت متأكد من حذف العنصر $name؟'
      : 'Are you sure you want to delete item $name?';

  static String get uploadImage => _isArabic ? 'رفع صورة' : 'Upload image';
  static String get changeImage => _isArabic ? 'تغيير الصورة' : 'Change image';
  static String get uploadFailed =>
      _isArabic ? 'فشل رفع الصورة' : 'Image upload failed';
  static String errorWith(Object e) =>
      _isArabic ? 'خطأ: $e' : 'Error: $e';
  static String get notAvailable =>
      _isArabic ? 'غير متوفر' : 'Not available';
  static String get imageUnavailable =>
      _isArabic ? 'الصورة غير متاحة' : 'Image unavailable';

  static String get orderInfo =>
      _isArabic ? 'معلومات الطلب' : 'Order information';
  static String get customerInfo =>
      _isArabic ? 'معلومات العميل' : 'Customer information';
  static String get driverInfo =>
      _isArabic ? 'معلومات السائق' : 'Driver information';
  static String get deliveryInfo =>
      _isArabic ? 'معلومات التوصيل' : 'Delivery information';
  static String get orderedItems =>
      _isArabic ? 'الأصناف المطلوبة' : 'Ordered items';
  static String get priceSummary =>
      _isArabic ? 'ملخص الأسعار' : 'Price summary';
  static String get createdAt =>
      _isArabic ? 'تاريخ الإنشاء' : 'Created at';
  static String get lastUpdated =>
      _isArabic ? 'آخر تحديث' : 'Last updated';
  static String get paymentMethod =>
      _isArabic ? 'طريقة الدفع' : 'Payment method';
  static String get name => _isArabic ? 'الاسم' : 'Name';
  static String get email => _isArabic ? 'البريد' : 'Email';
  static String get address => _isArabic ? 'العنوان' : 'Address';
  static String get noCustomerData =>
      _isArabic ? 'لا توجد بيانات عميل' : 'No customer data';
  static String get noDriverAssigned =>
      _isArabic ? 'لم يتم تعيين سائق بعد' : 'No driver assigned yet';
  static String get driverIdLabel =>
      _isArabic ? 'معرف السائق' : 'Driver ID';
  static String get deliveryLocation =>
      _isArabic ? 'موقع التوصيل' : 'Delivery location';
  static String get driverLocation =>
      _isArabic ? 'موقع السائق' : 'Driver location';
  static String get noDriverLocation =>
      _isArabic ? 'لا يوجد موقع سائق متاح' : 'No driver location available';
  static String get noItems =>
      _isArabic ? 'لا توجد أصناف' : 'No items';
  static String get subtotal =>
      _isArabic ? 'المجموع الفرعي' : 'Subtotal';
  static String get discount => _isArabic ? 'الخصم' : 'Discount';
  static String get deliveryFee =>
      _isArabic ? 'رسوم التوصيل' : 'Delivery fee';
  static String get currentStatus =>
      _isArabic ? 'الحالة الحالية' : 'Current status';
  static String get waitingDriverAssign => _isArabic
      ? 'في انتظار تعيين سائق من التطبيق'
      : 'Waiting for driver assignment from the app';
  static String get cancelOrder =>
      _isArabic ? 'إلغاء الطلب' : 'Cancel order';
  static String get acceptOrder =>
      _isArabic ? 'قبول الطلب' : 'Accept order';
  static String get startPreparing =>
      _isArabic ? 'بدء التجهيز' : 'Start preparing';
  static String get readyForPickupAction =>
      _isArabic ? 'جاهز للاستلام' : 'Ready for pickup';
  static String get confirmCancel =>
      _isArabic ? 'تأكيد الإلغاء' : 'Confirm cancel';
  static String get undo => _isArabic ? 'تراجع' : 'Undo';
  static String cancelOrderMsg(String id) => _isArabic
      ? 'هل أنت متأكد من إلغاء الطلب #$id؟'
      : 'Are you sure you want to cancel order #$id?';

  static String get driverInformation =>
      _isArabic ? 'بيانات السائق' : 'Driver information';
  static String get driverStatusSection =>
      _isArabic ? 'حالة السائق' : 'Driver status';
  static String get approvalStatus =>
      _isArabic ? 'حالة الاعتماد' : 'Approval status';
  static String get vehicleInfo =>
      _isArabic ? 'معلومات المركبة' : 'Vehicle information';
  static String get driverImages =>
      _isArabic ? 'الصور والمستندات' : 'Images & documents';
  static String get profilePhoto =>
      _isArabic ? 'الصورة الشخصية' : 'Profile photo';
  static String get licenseImage =>
      _isArabic ? 'رخصة القيادة' : 'Driver license';
  static String get idFront =>
      _isArabic ? 'البطاقة - وجه' : 'ID front';
  static String get idBack =>
      _isArabic ? 'البطاقة - ظهر' : 'ID back';
  static String get approvalSystem =>
      _isArabic ? 'نظام الاعتماد' : 'Approval system';
  static String get role => _isArabic ? 'الدور' : 'Role';
  static String get idLabel => _isArabic ? 'المعرف' : 'ID';
  static String get unnamedDriver =>
      _isArabic ? 'سائق بدون اسم' : 'Unnamed driver';

  static String get statusPending =>
      _isArabic ? 'قيد الانتظار' : 'Pending';
  static String get statusAccepted =>
      _isArabic ? 'تم قبول الطلب' : 'Accepted';
  static String get statusPreparing =>
      _isArabic ? 'جاري التجهيز' : 'Preparing';
  static String get statusReadyForPickup =>
      _isArabic ? 'جاهز للاستلام' : 'Ready for pickup';
  static String get statusDriverAssigned =>
      _isArabic ? 'تم تعيين سائق' : 'Driver assigned';
  static String get statusCompleted =>
      _isArabic ? 'مكتمل' : 'Completed';
  static String get statusCancelledByRestaurant =>
      _isArabic ? 'أُلغي بواسطة المطعم' : 'Cancelled by restaurant';

  static List<String> get weekDaysMonFirst => _isArabic
      ? ['إثنين', 'ثلاثاء', 'أربعاء', 'خميس', 'جمعة', 'سبت', 'أحد']
      : ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

  static String statusLabel(String status) {
    switch (status) {
      case 'pending':
        return statusPending;
      case 'accepted':
        return statusAccepted;
      case 'preparing':
        return statusPreparing;
      case 'readyForPickup':
        return statusReadyForPickup;
      case 'driverAssigned':
        return statusDriverAssigned;
      case 'completed':
        return statusCompleted;
      case 'cancelledByRestaurant':
        return statusCancelledByRestaurant;
      default:
        return status;
    }
  }
}
