@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-10 col-md-offset-1">
		@if(!$listband->isEmpty())
			<h4>Hasil Pencarian : </h4>	
			@foreach($listband as $_listband)
				<div class="panel panel-default">
					<div class="panel-heading"><a href={{ url('/band/'.$_listband->slug) }}>{{$_listband->nama_grupband}}</a>
					</div>
					<div class="panel-body">
						{{$_listband->deskripsi}}
					</div>
				</div>
			@endforeach
		@else
			<p class="center">Tidak ada band ditemukan.</p>
		@endif
        </div>
    </div>
</div>
@endsection