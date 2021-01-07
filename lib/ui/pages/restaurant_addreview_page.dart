part of 'pages.dart';

class AddReviewPage extends StatefulWidget {
  static const routeName = '/addReview_page';
  final String id;
  AddReviewPage({@required this.id});

  @override
  _AddReviewPageState createState() => _AddReviewPageState();
}

class _AddReviewPageState extends State<AddReviewPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final callDetailProvider = DetailRestaurantProvider(apiService: ApiService());
  bool _addData = false;
  @override
  void initState() {
    callDetailProvider.fetchDetailRestaurant(widget.id);
    super.initState();
  }

  void _addDataReview(Map data) {
    _addData = true;
    callDetailProvider.fetchDetailRestaurant(widget.id);
    callDetailProvider.addRestaurantReview(data);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DetailRestaurantProvider>(
      create: (_) => callDetailProvider,
      child: Scaffold(
        backgroundColor: mainColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 10),
                      child: IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 70),
                      child: Text(
                        'Add Review Resto',
                        style: GoogleFonts.dancingScript(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                _addBtnReviewRestaurant(),
                _addReviewListBox(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _addBtnReviewRestaurant() => Container(
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      width: 1,
                      color: mainColor,
                    )),
                child: Consumer<DetailRestaurantProvider>(
                  builder: (context, value, _) {
                    return FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Review Resto',
                            style: amberTextFont.copyWith(
                              fontWeight: FontWeight.w300,
                              fontSize: 16,
                            ),
                          ),
                          Icon(
                            Icons.rate_review,
                            color: mainColor,
                          ),
                        ],
                      ),
                      onPressed: () {
                        _showDialogReview(context);
                      },
                    );
                  },
                )),
          ],
        ),
      );
  Future<void> _showDialogReview(BuildContext context) async =>
      await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          final _namaCustomer = TextEditingController();
          final _reviewCustomer = TextEditingController();
          return AlertDialog(
            content: Form(
              key: _formKey,
              child: Container(
                height: 220,
                width: 200,
                child: Column(
                  children: [
                    Text(
                      'Review Restaurant',
                      style: amberTextFont,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      validator: (value) {
                        return value.isNotEmpty
                            ? null
                            : 'Name cannot be empty!';
                      },
                      controller: _namaCustomer,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.amber),
                            borderRadius: BorderRadius.circular(10)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.amber),
                            borderRadius: BorderRadius.circular(10)),
                        hintText: 'Input your name',
                        hintStyle: amberTextFont,
                        labelStyle: amberTextFont,
                        prefixIcon: Icon(
                          Icons.people_alt,
                          color: Colors.amber,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      minLines: 3,
                      maxLines: 10,
                      keyboardType: TextInputType.multiline,
                      validator: (value) {
                        return value.isNotEmpty ? null : 'Review cannot empty!';
                      },
                      controller: _reviewCustomer,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.amber),
                            borderRadius: BorderRadius.circular(10)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.amber),
                            borderRadius: BorderRadius.circular(10)),
                        hintText: 'Input your review',
                        hintStyle: amberTextFont,
                        labelStyle: amberTextFont,
                        prefixIcon: Icon(
                          Icons.rate_review,
                          color: Colors.amber,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              FlatButton(
                color: Colors.grey,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Back',
                  style: whiteTextFont,
                ),
              ),
              FlatButton(
                color: Colors.amber,
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _addDataReview({
                      'id': widget.id,
                      'name': _namaCustomer.text,
                      'review': _reviewCustomer.text
                    });
                    Navigator.pop(context);
                  }
                },
                child: Text(
                  'Add Review',
                  style: whiteTextFont,
                ),
              ),
            ],
          );
        },
      );
  Widget _addReviewListBox(BuildContext context) => Expanded(
          child: Container(
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(50),
            topLeft: Radius.circular(50),
          ),
        ),
        child: _customerReview(),
      ));
  Consumer<DetailRestaurantProvider> _customerReview() => Consumer(
        builder: (context, value, _) {
          switch (value.state) {
            case ResultStateRestaurant.Loading:
              return Center(
                child: loadingIndicator,
              );
              break;
            case ResultStateRestaurant.HasData:
              if (!_addData) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CardReviewRestaurant(
                      listRestaurantReview:
                          value.result.restaurant.customerReviews),
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CardReviewRestaurant(
                      listRestaurantReview: value.resultAdd.customerReviews),
                );
              }
              break;
            case ResultStateRestaurant.NoData:
              return Center(
                child: Column(
                  children: [
                    loadingIndicator,
                    SizedBox(
                      height: 10,
                    ),
                    Text(value.message),
                  ],
                ),
              );
            case ResultStateRestaurant.Error:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Cek koneksi internet anda !"),
                  ],
                ),
              );
            default:
              return Center(
                child: Text(''),
              );
              break;
          }
        },
      );
}
