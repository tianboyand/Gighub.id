@extends('layouts.app')

@section('content')
<div class="container">
@if (Session::has('message'))
    <div class="alert alert-info">{{ Session::get('message') }}</div>
@endif
    <div class="row">
		<div class="col-md-12">
			<img name="cover" class="coverimage" src={!! Cloudder::show($band->cover, array("crop" => "scale", "width" => 1140, "height" => 187)) !!}>
			<hr/>
		</div>
        <div class="col-md-10 col-md-offset-1">
			
            <div class="panel panel-default">			
					<div class="panel-body">
						<div class="col-md-6">
							<img name="aboutme"class="img-circle" src={!! Cloudder::show($band->photo) !!}>
							<div class="row">
								<br/>
								{{$band->nama_grupband}} | 
								@if(Auth::guard('musician')->user())
									@if($band->admin_id == Auth::guard('musician')->user()->id)
										<a href={{ url('/edit-band/'.$band->slug) }}>edit</a>
									@endif
								@endif
								<p>{{$band->basis}}</p>
								Rp. {{$band->harga}} /Jam
								<p>{{$band->kota}}</p>
								<p>
									<?php 
									for($i=0;$i<$review;$i++)
										echo "<i class='fa fa-star'></i>";
									?>
								</p>


							@if(Auth::guard('user')->user())
								@if(Auth::guard('user')->user()->id)
									<br/>
									<a href={{url('sewa-band/'.$band->slug)}} class="btn btn-info" role="button">SEWA</a>

								@endif
							@endif

								@if(Auth::guard('user')->user())

								@elseif(Auth::guard('musician')->user())

								@else
									<br/>
									<a href={{url('sewa-band/'.$band->slug)}} class="btn btn-info" role="button">SEWA</a>
								@endif

								<h3>DESKRIPSI</h3>
								<p>{{$band->deskripsi}}</p>
							</div>
						</div>
						<div class="col-md-6">
							@if($band->youtube_video != null)
								<?php $str = "$band->youtube_video";
								$embed = str_replace("watch?v=","embed/",$str);?>
								<h3>Video {{$band->nama_grupband}}</h3>
									<iframe title="YouTube video player" class="youtube-player" type="text/html" 
									width="430" height="280" src="{{$embed}}"
									frameborder="0" allowFullScreen></iframe>
							@endif
							<div class="row">
								<h3>Anggota Band ({{ $anggota->count()}})</h3>
								@foreach($anggota as $_anggota)
									<img name="aboutme"class="img-circle" style="width: 20%;" src={!! Cloudder::show($_anggota->photo) !!}>
									<p><a href={{ url('/musician/'.$_anggota->slug) }}>{{$_anggota->name}} ( {{ $_anggota->position_name }} ) @if($band->admin_id == $_anggota->id)(Admin)@endif</a>			
								@if(Auth::guard('musician')->user())
									@if($band->admin_id == Auth::guard('musician')->user()->id )
										@if($_anggota->id != $band->admin_id)
											<a href={{ url('delete-anggota/'.$band->slug.'/'.$_anggota->id) }}>Hapus</a>
										@endif	
									@endif

									@if(Auth::guard('musician')->user()->id == $_anggota->id)
										@if($_anggota->id != $band->admin_id)
											<a href={{ url('delete-anggota/'.$band->slug.'/'.$_anggota->id) }}>Keluar</a>
										@endif
									@endif									
								@endif

									</p>
								@endforeach
							@if(Auth::guard('musician')->user())
								@if($band->admin_id == Auth::guard('musician')->user()->id)
									<a href="#" value="{{ action('MusicianController@listMusisi') }}" data-toggle="modal" data-target="#modalMd">Tambahkan anggota</a>
								@endif
							@endif
							</div>
						</div>
					</div>
            </div>			
        </div>
    </div>
</div>


<!-- MODAL Add ANGGOTA BAND -->
@if(Auth::guard('musician')->user())
	@if($band->admin_id == Auth::guard('musician')->user()->id)
		<div class="modal  fade" id="modalMd" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" >
		  <div class="modal-dialog" role="document">
			<div class="modal-content">

			  <div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="myModalLabel">List Musisi</h4>
			  </div>

			  <div class="modal-body" id="modaladd">
				@if($compare != null)
					@foreach($compare as $musisi)
						<p>{{$musisi->name}}
						{{ Form::open(['route'=>['add.anggota',$band->slug,$musisi->id],'role'=> 'form', 'class' => 'ui reply form']) }}
							<select class="form-control" name="posisi" id="posisi" Required>
								<?php $posisi = App\Position::all()?>
								<option value="">- Pilih Posisi -</option>
								@foreach($posisi as $valposisi)
									<option value="{{$valposisi->id}}">{{$valposisi->position_name}}</option>
								@endforeach
							</select>
							<button>Tambahkan Anggota</button>
						{{ Form::close() }}
						</p>					
					@endforeach
				@else
					<p>Tidak ada Musisi</p>
				@endif			
			  </div>
			</div>
		  </div>
		</div>
	@endif
@endif
@endsection