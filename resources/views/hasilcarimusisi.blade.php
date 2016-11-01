@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-10 col-md-offset-1">
		@if(!$listmusisi->isEmpty())
			<h4>Hasil Pencarian : </h4>	
			@foreach($listmusisi as $_listmusisi)
				<div class="panel panel-default">
					<div class="panel-heading"><a href={{ url('/musician/'.$_listmusisi->slug) }}>{{$_listmusisi->name}}</a>
					</div>
					<div class="panel-body">
						{{$_listmusisi->deskripsi}}
					</div>
				</div>
			@endforeach
		@else
			<p class="center">Tidak ada musisi ditemukan.</p>
		@endif
        </div>
    </div>
</div>
@endsection