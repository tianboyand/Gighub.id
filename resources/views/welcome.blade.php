@extends('layouts.app')

@section('content')
@if(Auth::guard('musician')->user())
@if(Session::has('message'))
    <div class="alert alert-info">{{ Session::get('message') }}</div>
@endif
    <div class="container">
    @if(Auth::guard('musician')->user()->deskripsi == null || Auth::guard('musician')->user()->no_telp == null || Auth::guard('musician')->user()->kota == null || Auth::guard('musician')->user()->harga_sewa == null)
        <div class="alert alert-danger">Lengkapi data akun kamu, untuk membuka fitur yang terkunci</div>
    @endif
        <div class="panel panel-default">
            <div class="panel-body">
                <div class="media">
                    <div class="media-left">
                        <form class="bootstrap-form-with-validation" action="musician/photo/update" id="proc-upload" method="POST" enctype="multipart/form-data">
                            <img src={!! Cloudder::show(Auth::guard('musician')->user()->photo , ['format' => 'jpg', 'crop' => 'fit', 'width' => '350', 'height'=> '350']) !!} alt="Logo" class="widthfull">
                            <div class="row">
                                <div class="col-lg-10 col-lg-offset-2 col-md-12">
                                <label class="uploading btn btn-primary">
                                    <span>Upload Photo</span>
                                    <input type="file" id="photo" name="photo" required>
                                </label>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="media-body">
                        <?php $bankakun = App\Musician::join('bank_musisi', 'musicians.id','=','bank_musisi.musician_id')
                                                    ->join('banks', 'bank_musisi.bank_id','=','banks.id')
                                                    ->where('musicians.id', Auth::guard('musician')->user()->id)->first();
                        ?>
                        <ul class="list-unstyled fa-ul">
                            <li></li>
                            <li></li>
                        </ul>
                        <div class="row">
                            <div class="col-lg-11 col-lg-offset-1 col-sm-12">
                                <h1>{{ Auth::guard('musician')->user()->name }}</h1></div>
                            <div class="col-lg-11 col-lg-offset-1 col-md-12">
                                <p>Harga Sewa / Jam : Rp. {{ Auth::guard('musician')->user()->harga_sewa }}</p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-11 col-lg-offset-1 col-md-12">
                                <p>Tipe : {{ Auth::guard('musician')->user()->tipe }}</p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-11 col-lg-offset-1 col-md-12">
                                <p>Basis : {{ Auth::guard('musician')->user()->basis }}</p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-11 col-lg-offset-1 col-md-12">
                                <p>Kota : {{ Auth::guard('musician')->user()->kota }}</p>
                            </div>
                        </div>
                        <div class="row">
                            <?php $genremusisi = App\GenreMusisi::join('genres', 'genre_musisi.genre_id' ,'=', 'genres.id')->where('musician_id', Auth::guard('musician')->user()->id)->get();?>
                            <div class="col-lg-11 col-lg-offset-1 col-sm-12">
                                <p>Genre : 
                                @foreach($genremusisi as $genredetail)
                                    {{$genredetail->genre_name}} |
                                @endforeach
                                </p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-11 col-lg-offset-1 col-sm-12">
                                <p>Deskripsi : {{ Auth::guard('musician')->user()->deskripsi }}</p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-11 col-lg-offset-1 col-sm-12">
                                <p>No.Telepon : {{ Auth::guard('musician')->user()->no_telp }}</p>
                            </div>
                        </div>
                        <hr/>
                        <div class="row">
                            <div class="col-lg-11 col-lg-offset-1 col-sm-12">
                                <p>No.Rekening : @if($bankakun != null){{ $bankakun->no_rek }}@endif</p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-11 col-lg-offset-1 col-sm-12">
                                <p>Nama Pemilik Rekening : @if($bankakun != null){{ $bankakun->atas_nama }}@endif</p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-11 col-lg-offset-1 col-sm-12">
                                <p>Nama bank : @if($bankakun != null){{ $bankakun->nama_bank }}@endif</p>
                            </div>
                        </div>
                    </div>
                </div>
                <hr>
                <div class="row">
                    <div class="col-lg-6 col-lg-offset-3 col-sm-12">
                        <form class="bootstrap-form-with-validation" action="musician/profile/update" method="POST">
                            <h2 class="text-center">Lengkapi Profil Musisi</h2>
                            <label>Nama Musisi</label>
                            <div class="form-group">
                                <input class="form-control" type="text" name="name" id="text-input" value="{{ Auth::guard('musician')->user()->name }}" required>
                            </div>
                            <label>Kota </label>
                            <select class="form-control" name="kota" id="kota" required>
                                <option value="" hidden>Pilih Kota</option>
                                @if(Auth::guard('musician')->user()->kota == null)
                                   <option hidden>{{ Auth::guard('musician')->user()->kota}}</option>
                                @else
                                    <option hidden selected>{{ Auth::guard('musician')->user()->kota}}</option>
                                @endif
                                <option value="Jakarta">Jakarta</option>
                                <option value="Medan">Medan</option>
                                <option value="Bandung">Bandung</option>
                                <option value="Surabaya">Surabaya</option>
                                <option value="Semarang">Semarang</option>
                            </select>
                            <div class="form-group"></div>
                            <label>Genre Musisi</label>
                            <div class="row">
                                <?php $genre = App\Genre::all(); $cek ='';?>
                                @foreach($genre as $genres)
                                    <div class="col-lg-2 col-md-12">
                                        <div class="checkbox">
                                        @if(!$genremusisi->isEmpty()) 
                                            @foreach($genremusisi as $genrem)
                                                <?php $genrems[] = $genrem->genre_id?>                                         
                                            @endforeach

                                            @if(in_array($genres->id, $genrems))
                                                <?php $cek = ' checked'?>
                                            @else
                                                <?php $cek = ' unchecked'?>
                                            @endif                                          
                                            <label><input type="checkbox" name="checkbox[]" value="{{$genres->id}}" <?php echo $cek; ?>
                                            >{{$genres->genre_name}}</label>
                                        @else
                                            <label><input type="checkbox" name="checkbox[]" value="{{$genres->id}}"<
                                            >{{$genres->genre_name}}</label>
                                        @endif
                                        </div>
                                    </div>
                                    
                                @endforeach
                            </div>
                            <div class="form-group"></div>
                            <label>Basis</label>
                            <div class="form-group">
                                <input class="form-control" type="text" name="basis" id="text-input" value="{{ Auth::guard('musician')->user()->basis }}" required>
                            </div>
                            <div class="form-group"></div>
                            <label>No.Telepon </label>
                            <input class="form-control" type="text" name='no_telp' placeholder="No.Telepon" value="{{ Auth::guard('musician')->user()->no_telp }}" required>
                            <div class="form-group"></div>
                            <label>Deskripsi </label>
                            <textarea class="form-control" rows="5" name='deskripsi' placeholder="Jelaskan informasi tentang dirimu" required>{{ Auth::guard('musician')->user()->deskripsi }}</textarea>
                            <div class="form-group"></div>
                            <label>Harga Sewa / Jam</label>
                            <input class="form-control" type="number" name="harga_sewa" value="{{ Auth::guard('musician')->user()->harga_sewa }}" required>
                            <div class="form-group"></div>
                            <label>No.Rekening </label>
                            <input class="form-control" type="text" name='norek' placeholder="No.Rekening" @if($bankakun != null) value="{{ $bankakun->no_rek }}" @endif required>
                            <div class="form-group"></div>
                            <label>Nama Pemilik Rekening </label>
                            <input class="form-control" type="text" name='namapemilik' placeholder="Nama yang tercantum di Rekening" @if($bankakun != null) value="{{ $bankakun->atas_nama }}" @endif required>
                            <div class="form-group"></div>
                            <label>Nama Bank </label>
                            <input class="form-control" type="text" name='bank' placeholder="eg: BRI" @if($bankakun != null) value="{{ $bankakun->nama_bank }}" @endif required>

                            <div class="form-group"></div>
                            <label>Channel Youtube </label>
                            <input class="form-control" type="text" name="youtube_video"  value="{{ Auth::guard('musician')->user()->youtube_video }}" placeholder="http://www.youtube.com/watch?v=a8ZIHib0__4">
                            <div class="form-group"></div>
                            <label>Soundcloud Username (Optional)</label>
                            <input class="form-control" type="text" name="username_soundcloud" value="{{ Auth::guard('musician')->user()->username_soundcloud }}" placeholder="http://www.soundcloud.com/username">
                            <div class="form-group"></div>
                            <label>Revebnation Username (Optional)</label>
                            <input class="form-control" type="text" name="username_reverbnation" value="{{ Auth::guard('musician')->user()->username_reverbnation }}" placeholder="http://www.reverbnation.com/username">
                            <div class="form-group"></div>
                            <label>Website (Optional)</label>
                            <input class="form-control" type="text" name="url_website" value="{{ Auth::guard('musician')->user()->url_website }}" placeholder="http://www.namamusisi.com/">
                            <div class="form-group"></div>
                            <div class="form-group">
                                <button class="btn btn-primary" type="submit">Submit</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="panel-footer"></div>
        </div>
    </div>
    
@else
    <div class="container">
        <div class="row">
            <div class="col-md-10 col-md-offset-1">
                <div class="panel panel-default">
                @if(Auth::guard('user')->user())
                    

                    <div class="jumbotron">
                    <h2 class="text-center">Temukan musisi sesuai kriteramu</h2>
                    <p class="text-center">Nullam id dolor id nibh ultricies vehicula ut id elit. Cras justo odio, dapibus ac facilisis in, egestas eget quam.</p>
                    <div class="row">
                        <div class="col-md-4 col-md-offset-4">
                            <form class="bootstrap-form-with-validation" action="{{ url('/search')}}" method="POST">
                                <h2 class="text-center">Tentukan Kriteriamu</h2>
                                <div class="form-group">
                                    <label class="control-label" for="text-input">Tanggal Main</label>
                                    <input class="form-control" type="text" name="tanggal" id="mulai">                            
                                </div>
                                <div class="form-group">
                                    <?php
                                        $kota = App\Grupband::groupBy('kota')->get(['kota']);
                                    ?>
                                    <label class="control-label" for="email-input">Kota</label>
                                    <select class="form-control" name="kota">
                                        <option value="">Pilih Kota (Opsional)</option>
                                    @foreach($kota as $_kota)
                                        <option value="{{$_kota->kota}}">{{$_kota->kota}}</option>
                                    @endforeach
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label class="control-label" for="email-input">Tipe Musisi</label>
                                    <select class="form-control" name="tipe" required>
                                        <option value="">Pilih Tipe</option>
                                        <option value="0">Grup Band</option>
                                        <option value="1">Solo</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                <?php $genre = App\Genre::all(); $cek ='';?>
                                    <label class="control-label" for="textarea-input">Genre Musisi</label>
                                    <div class="row">
                                    @foreach($genre as $genres)
                                        <div class="col-lg-4 col-sm-6">
                                            <div class="checkbox">
                                                <label class="control-label">
                                                    <input type="checkbox" name="checkbox[]" value="{{$genres->id}}" >{{$genres->genre_name}}
                                                </label>
                                            </div>
                                        </div>
                                    @endforeach
                                    </div>
                                </div>
                                <div class="form-group">
                                    <button class="btn btn-primary btn-lg" type="submit">Temukan </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>    


                @elseif(Auth::guard('musician')->user())
                    <div class="panel-heading">Welcome {{Auth::guard('musician')->user()->name}}</div>

                    <div class="panel-body">
                        Your Application's Landing Page.
                    </div>
                @elseif(Auth::guard('admin')->user())
                    <div class="panel-heading">Welcome Admin {{Auth::guard('admin')->user()->first_name}}</div>

                    <div class="panel-body">
                        Your Application's Landing Page.
                    </div>
                @else

                <div class="jumbotron">
                    <h2 class="text-center">Temukan musisi sesuai kriteramu</h2>
                    <p class="text-center">Nullam id dolor id nibh ultricies vehicula ut id elit. Cras justo odio, dapibus ac facilisis in, egestas eget quam.</p>
                    <div class="row">
                        <div class="col-md-4 col-md-offset-4">
                            <form class="bootstrap-form-with-validation" action="{{ url('/search')}}" method="POST">
                                <h2 class="text-center">Tentukan Kriteriamu</h2>
                                <div class="form-group">
                                    <label class="control-label" for="text-input">Tanggal Main</label>
                                    <input class="form-control" type="text" name="tanggal" id="mulai">                            
                                </div>
                                <div class="form-group">
                                    <?php
                                        $kota = App\Grupband::groupBy('kota')->get(['kota']);
                                    ?>
                                    <label class="control-label" for="email-input">Kota</label>
                                    <select class="form-control" name="kota">
                                        <option value="">Pilih Kota (Opsional)</option>
                                    @foreach($kota as $_kota)
                                        <option value="{{$_kota->kota}}">{{$_kota->kota}}</option>
                                    @endforeach
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label class="control-label" for="email-input">Tipe Musisi</label>
                                    <select class="form-control" name="tipe" required>
                                        <option value="">Pilih Tipe</option>
                                        <option value="0">Grup Band</option>
                                        <option value="1">Solo</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                <?php $genre = App\Genre::all(); $cek ='';?>
                                    <label class="control-label" for="textarea-input">Genre Musisi</label>
                                    <div class="row">
                                    @foreach($genre as $genres)
                                        <div class="col-lg-4 col-sm-6">
                                            <div class="checkbox">
                                                <label class="control-label">
                                                    <input type="checkbox" name="checkbox[]" value="{{$genres->id}}" >{{$genres->genre_name}}
                                                </label>
                                            </div>
                                        </div>
                                    @endforeach
                                    </div>
                                </div>
                                <div class="form-group">
                                    <button class="btn btn-primary btn-lg" type="submit">Temukan </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>    
                @endif
                
                </div>
            </div>
        </div>
    </div>
@endif



@endsection
