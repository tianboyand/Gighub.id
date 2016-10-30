@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-10 col-md-offset-1">
		@if(!$band->isEmpty())	
			@foreach($band as $_band)
				<div class="panel panel-default">
					<div class="panel-heading"><a href={{ url('/band/'.$_band->slug) }}>{{$_band->nama_grupband}}</a>
					</div>
					<div class="panel-body">
						{{$_band->deskripsi}}
					</div>
				</div>
			@endforeach
		@else
			<p class="center">Tidak ada band</p>
		@endif
        </div>
    </div>
</div>
@endsection