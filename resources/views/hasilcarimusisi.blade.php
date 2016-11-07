@extends('layouts.app')

@section('content')
<div class="container">
@if (Session::has('message'))
    <div class="alert alert-info">{{ Session::get('message') }}</div>
@endif
    <div class="row">
        <div class="col-md-10 col-md-offset-1">
        @if(is_object($listmusisi))
			@if(!$listmusisi->isEmpty())
				<h4>Hasil Pencarian : </h4>	
				@foreach($listmusisi as $_listmusisi)
					<div class="panel panel-default">
						<div class="panel-heading"><a href={{ url('/musician/'.$_listmusisi->slug) }}>{{$_listmusisi->name}}</a>
						</div>
						<div class="panel-body">
							{{$_listmusisi->deskripsi}}
							<br/>

							@if(Auth::guard('user')->user())
	                        	<a href={{url('sewa-musisi/'.$_listmusisi->slug)}} class="btn btn-info" role="button">SEWA</a>
	                    	@endif
	                    	
							@if(Auth::guard('user')->user())

		                    @elseif(Auth::guard('musician')->user())

		                    @else
		                        <a href={{url('sewa-musisi/'.$_listmusisi->slug)}} class="btn btn-info" role="button">SEWA</a>
		                    @endif
						</div>
					</div>
				@endforeach
			@else
				<p class="center">Tidak ada musisi ditemukan.</p>
			@endif
		@else
			@if($listmusisi != null)
				<h4>Hasil Pencarian : </h4>	
				@foreach($listmusisi as $_listmusisi)
					<div class="panel panel-default">
						<div class="panel-heading"><a href={{ url('/musician/'.$_listmusisi->slug) }}>{{$_listmusisi->name}}</a>
						</div>
						<div class="panel-body">
							{{$_listmusisi->deskripsi}}
							<br/>

							@if(Auth::guard('user')->user())
	                        	<a href={{url('sewa-musisi/'.$_listmusisi->slug)}} class="btn btn-info" role="button">SEWA</a>
	                    	@endif
	                    	
							@if(Auth::guard('user')->user())

		                    @elseif(Auth::guard('musician')->user())

		                    @else
		                        <a href={{url('sewa-musisi/'.$_listmusisi->slug)}} class="btn btn-info" role="button">SEWA</a>
		                    @endif
						</div>
					</div>
				@endforeach
			@else
				<p class="center">Tidak ada musisi ditemukan.</p>
			@endif
		@endif
        </div>
    </div>
</div>
@endsection