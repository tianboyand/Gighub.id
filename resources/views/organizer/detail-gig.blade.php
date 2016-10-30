@extends('layouts.app')

@section('content')
<div class="container">
@if(Session::has('message'))
    <div class="alert alert-info">{{ Session::get('message') }}</div>
@endif
    <div class="row">
        <div class="col-md-10 col-md-offset-1">
			
            <div class="panel panel-default">			
					<div class="panel-body">
						<div class="col-md-6">
							<img name="aboutme" src={!! Cloudder::show($gigs->photo_gig) !!}>
							<div class="row">
								<br/>
								{{$gigs->nama_gig}}
								@if(Auth::guard('user')->user())
									@if($gigs->user_id == Auth::guard('user')->user()->id)
										<a href={{ url('/edit-gig/'.$gigs->slug) }}>edit</a>
									@endif
								@endif
								<br/>
								Waktu : {{$gigs->tanggal_mulai}} s/d {{$gigs->tanggal_selesai}}
								<br/>
								{{$gigs->lokasi}}

							@if(Auth::guard('musician')->user())
								<?php
									$sewa = App\Sewa::where('gig_id', $gigs->id)->where('status_request', 1)->get();
								?>
								@if($sewa->isEmpty())
									<br/>									
									<a href="#" data-toggle="modal" data-target="#modalOffer">OFFER GIG</a>
								@endif
							@endif

								<h3>DESKRIPSI</h3>
								<p>{{$gigs->deskripsi}}</p>
							</div>
						</div>
						<div class="col-md-6">
							<div class="row">
								<h3>List Penawar</h3>
								@if(!$offer->isEmpty())
									@foreach($offer as $penawar)
										@if($penawar->type_sewa == 'bandhire')
											<img name="aboutme"class="img-circle" style="width: 20%;" src={!! Cloudder::show($penawar->penawar[0]->photo) !!}>
											<p><a href={{url('band/'.$penawar->penawar[0]->slug)}}>{{$penawar->penawar[0]->nama_grupband}}</a></p>
										@elseif($penawar->type_sewa == 'musisihire')
											<img name="aboutme"class="img-circle" style="width: 20%;" src={!! Cloudder::show($penawar->penawar[0]->photo) !!}>
											<p><a href={{url('musician/'.$penawar->penawar[0]->slug)}}>{{$penawar->penawar[0]->name}}</a></p>
										@endif
									@endforeach
								@else
									<p>Tidak ada Penawar</p>
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
	<div class="modal  fade" id="modalOffer" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" >
	  <div class="modal-dialog" role="document">
		<div class="modal-content">

		  <div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			<h4 class="modal-title" id="myModalLabel">Offer Gig - {{$gigs->nama_gig}}</h4>
		  </div>
		
		  <div class="modal-body" id="modaladd">
		  	<div class="col-md-12">
				<div class="col-md-6">
					<p>Offer sebagai musisi</p>
					<a class="btn btn-primary" href={{url('offer-gig/'.$gigs->id)}}>OFFER</a>
				</div>
				<div class="col-md-6">
					<p>Offer sebagai Band</p>
					{{ Form::open(['route'=>['add.offer',$gigs->id],'role'=> 'form', 'class' => 'ui reply form']) }}
						<select class="form-control" name="band" id="band">
							<?php $bands = App\Grupband::where('admin_id', Auth::guard('musician')->user()->id)->get()?>
							<option value="">- Pilih Band -</option>
							@foreach($bands as $band)
								<option value="{{$band->id}}">{{$band->nama_grupband}}</option>
							@endforeach
						</select>
						<button>OFFER</button>
					{{ Form::close() }}
				</div>
			</div>
		  </div>

		<div class="modal-footer">

		</div>

		</div>
	  </div>
	</div>
@endif
@endsection