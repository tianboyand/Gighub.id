<?php



use App\Http\Controllers\MusicianController;
/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the controller to call when that URI is requested.
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::group(['middleware' => ['web']], function(){
	Route::auth();
	Route::get('/home', 'HomeController@index');
    
});

Route::group(['middleware' => ['web']], function () {
    Route::auth();
    //Login Routes...
    Route::get('/admin/login','AdminAuth\AuthController@showLoginForm');
    Route::post('/admin/login','AdminAuth\AuthController@login');
    Route::get('/admin/logout','AdminAuth\AuthController@logout');

    //Login Routes Musician
    Route::get('/musician/login','MusicianAuth\AuthController@showLoginForm');
    Route::post('/musician/login','MusicianAuth\AuthController@login');
    Route::get('musician-logout','MusicianAuth\AuthController@logout');
    Route::get('/musician/{slug}','MusicianController@profile');

    //Registration Routes Musician
    Route::get('musician/register', 'MusicianAuth\AuthController@showRegistrationForm');
    Route::post('musician/register', 'MusicianAuth\AuthController@register');

    Route::post('musician/password/email','MusicianAuth\PasswordController@sendResetLinkEmail');
    Route::post('musician/password/reset','MusicianAuth\PasswordController@reset');
    Route::get('musician/password/reset/{token?}','MusicianAuth\PasswordController@showResetForm');

    Route::get('/musician', 'MusicianController@index'); 


    // Registration Routes...
    Route::get('admin/register', 'AdminAuth\AuthController@showRegistrationForm');
    Route::post('admin/register', 'AdminAuth\AuthController@register');

    Route::post('admin/password/email','AdminAuth\PasswordController@sendResetLinkEmail');
    Route::post('admin/password/reset','AdminAuth\PasswordController@reset');
    Route::get('admin/password/reset/{token?}','AdminAuth\PasswordController@showResetForm');

    Route::get('/admin', 'AdminController@index');
    Route::get('/admin/listuser', 'AdminController@listUser');
    Route::get('/admin/edit/user/{id}', 'AdminController@editUser');
    Route::post('admin/edit/user/{id}',['as' => 'edit.user','uses' =>'AdminController@inputEditUser']);
    Route::get('/admin/listmusisi', 'AdminController@listMusisi');
    Route::get('/admin/edit/musisi/{id}', 'AdminController@editMusisi');
    Route::post('admin/edit/musisi/{id}',['as' => 'edit.musisi','uses' =>'AdminController@inputEditMusisi']);
    Route::get('/admin/listband', 'AdminController@listBand');
    Route::get('/admin/edit/band/{id}', 'AdminController@editBand');
    Route::post('admin/edit/band/{id}',['as' => 'edit.band','uses' =>'AdminController@inputEditBand']);
    Route::get('/admin/listgig', 'AdminController@listGig');
    Route::get('/admin/edit/gig/{id}', 'AdminController@editGig');
    Route::post('admin/edit/gig/{id}',['as' => 'edit.gig','uses' =>'AdminController@inputEditGig']);
    Route::get('/admin/listorder', 'AdminController@listOrder');
    Route::get('/admin/create-genre', 'AdminController@createGenre');
    Route::post('admin/create-genre',['as' => 'add.genre','uses' =>'AdminController@inputGenre']);
    Route::get('/admin/create-bank', 'AdminController@createBank');
    Route::post('admin/create-bank',['as' => 'add.bank','uses' =>'AdminController@inputBank']);
    Route::get('/admin/create-posisi', 'AdminController@createPosisi');
    Route::post('admin/create-posisi',['as' => 'add.posisi','uses' =>'AdminController@inputPosisi']);
    Route::get('/admin/edit/order/{id}', 'AdminController@editOrder');
    Route::post('admin/edit/order/{id}',['as' => 'edit.order','uses' =>'AdminController@inputEditOrder']);
    Route::get('/admin/listwithdraw', 'AdminController@listWithdraw');
    Route::get('/admin/edit/withdraw/{id}', 'AdminController@editWithdraw');
    Route::post('admin/edit/withdraw/{id}',['as' => 'edit.withdraw','uses' =>'AdminController@inputEditWithdraw']);


    Route::post('musician/profile/update','MusicianController@doUpdateProfile');
    Route::post('musician/photo/update','MusicianController@doUpdatePhoto');
    Route::post('musician/add/band',['as' => 'add.band','uses' =>'MusicianController@addBand']);
    Route::get('band/{slug}', 'MusicianController@bandProfile');
    Route::get('list-band', 'MusicianController@listBand');
    Route::get('list-musisi', 'MusicianController@listMusisi');
    Route::get('edit-band/{slug}', 'MusicianController@editBand');
    Route::post('edit-band/save/{slug}', 'MusicianController@updateBand');
    Route::post('band/{slug}/{id}',['as' => 'add.anggota','uses' =>'MusicianController@addAnggota']);
    Route::get('delete-anggota/{slug}/{id}', 'MusicianController@deleteAnggota');
    Route::get('sewa-band/{slug}', 'OrganizerController@sewaBand');
    Route::post('sewa-band/{slug}',['as' => 'add.sewa','uses' =>'OrganizerController@inputSewaBand']);
    Route::get('sewa-musisi/{slug}', 'OrganizerController@sewaMusisi');
    Route::post('sewa-musisi/{slug}',['as' => 'add.sewamusisi','uses' =>'OrganizerController@inputSewaMusisi']);

    Route::post('offer-gig/{id}',['as' => 'add.offer','uses' =>'GigController@offerGigBand']);
    Route::get('offer-gig/{id}', 'GigController@offerGigMusisi');

    Route::get('discover-organizer', 'OrganizerController@index');
    Route::get('discover', 'MusicianController@index');
    Route::get('listsewa', 'OrganizerController@listSewa');
    Route::get('listsewa-band', 'OrganizerController@listSewaBand');
    Route::get('listsewa-musisi', 'OrganizerController@listSewaMusisi');
    Route::get('konfirmasi-pembayaran/{id}', 'OrganizerController@confirmPayment');
    Route::post('konfirmasi-pembayaran/{idsewa}',['as' => 'add.confirmpayment','uses' =>'OrganizerController@inputKonfirmasiPembayaran']);

    Route::get('listoffer', 'OrganizerController@listOffer');
    Route::get('listoffer-approve', 'OrganizerController@listOfferApprove');
    Route::get('listoffer-finish', 'OrganizerController@listOfferFinish');
    Route::get('listoffer-pending', 'OrganizerController@listOfferPending');

    Route::get('listsewa/musisi', 'MusicianController@listSewaMusisi');
    Route::get('listsewa/musisi/approve', 'MusicianController@listSewaMusisiApprove');
    Route::get('listsewa/musisi/selesai', 'MusicianController@listSewaMusisiSelesai');
    Route::get('listsewa/band', 'MusicianController@listSewaBands');
    Route::get('listsewa/band/{slug}', 'MusicianController@listSewaBand');
    Route::get('listsewa/band/approve/{slug}', 'MusicianController@listSewaBandApprove');
    Route::get('listsewa/band/selesai/{slug}', 'MusicianController@listSewaBandSelesai');

    Route::get('confirm-musisi/{idsewa}', 'MusicianController@confirmSewa');
    Route::get('cancel-musisi/{idsewa}', 'MusicianController@cancelSewa');

    Route::get('confirm-band/{idsewa}', 'MusicianController@confirmBand');
    Route::get('cancel-band/{idsewa}', 'MusicianController@cancelBand');

    Route::get('confirmoffer-musisi/{idsewa}/{slug}', 'MusicianController@confirmOfferSewa');
    Route::get('canceloffer-musisi/{idsewa}/{slug}', 'MusicianController@cancelOfferSewa');

    Route::get('confirmoffer-band/{idsewa}/{slug}', 'MusicianController@confirmOfferBand');
    Route::get('canceloffer-band/{idsewa}/{slug}', 'MusicianController@cancelOfferBand');

    Route::post('/search','CariController@pencarian');

    Route::get('create-gig', 'OrganizerController@createGig');
    Route::post('create-gig',['as' => 'add.gig','uses' =>'OrganizerController@inputGig']);
    Route::get('user/{slug}','OrganizerController@profile');
    Route::get('user/edit/{slug}','OrganizerController@editProfile');
    Route::post('user/edit/save/{slug}', 'OrganizerController@inputEditProfile');

    Route::get('gig/{slug}', 'GigController@detailGig');
    Route::get('edit-gig/{slug}', 'GigController@editGig');
    Route::post('edit-gig/save/{slug}', 'GigController@inputEditGig');
    Route::get('add-review/{idsewa}', 'GigController@addReview');
    Route::post('add-review/{idsewa}',['as' => 'review.new','uses' =>'GigController@inputReview']);
    Route::get('detail-review/{slug}', 'MusicianController@detailReview');
    Route::get('detail-review/band/{slug}', 'MusicianController@detailReviewBand');

    Route::get('musician/saldo/{slug}', 'MusicianController@saldo');
    Route::get('listband/saldo/{slug}', 'MusicianController@saldoBandList');
    Route::get('band/saldo/{slug}', 'MusicianController@saldoBand');
    Route::post('withdraw/{id}',['as' => 'add.withdraw','uses' =>'MusicianController@withdraw']);

    Route::get('notif/{id}', 'HomeController@detailNotif');

});  
