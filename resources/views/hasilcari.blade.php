@extends('layouts.app')

@section('content')
<div class="container">
@if (Session::has('message'))
    <div class="alert alert-info">{{ Session::get('message') }}</div>
@endif
    <div class="row">
        <div class="col-md-10 col-md-offset-1">
        @if(is_object($listband))
			@if(!$listband->isEmpty())
				<h4>Hasil Pencarian : </h4>	
				@foreach($listband as $_listband)
					<div class="panel panel-default">
						<div class="panel-heading"><a href={{ url('/band/'.$_listband->slug) }}>{{$_listband->nama_grupband}}</a>
						</div>
						<div class="panel-body">
							{{$_listband->deskripsi}}
							<br/>

							@if(Auth::guard('user')->user())
	                        	<a href={{url('sewa-musisi/'.$_listband->slug)}} class="btn btn-info" role="button">SEWA</a>
	                    	@endif
	                    	
							@if(Auth::guard('user')->user())

		                    @elseif(Auth::guard('musician')->user())

		                    @else
		                        <a href={{url('sewa-musisi/'.$_listband->slug)}} class="btn btn-info" role="button">SEWA</a>
		                    @endif
						</div>
					</div>
				@endforeach
			@else
				<p class="center">Tidak ada band ditemukan.</p>
			@endif
		@else
			@if($listband != null)
				<h4>Hasil Pencarian : </h4>	
				@foreach($listband as $_listband)
					<div class="panel panel-default">
						<div class="panel-heading"><a href={{ url('/band/'.$_listband->slug) }}>{{$_listband->nama_grupband}}</a>
						</div>
						<div class="panel-body">
							{{$_listband->deskripsi}}
							<br/>

							@if(Auth::guard('user')->user())
	                        	<a href={{url('sewa-musisi/'.$_listband->slug)}} class="btn btn-info" role="button">SEWA</a>
	                    	@endif
	                    	
							@if(Auth::guard('user')->user())

		                    @elseif(Auth::guard('musician')->user())

		                    @else
		                        <a href={{url('sewa-musisi/'.$_listband->slug)}} class="btn btn-info" role="button">SEWA</a>
		                    @endif
						</div>
					</div>
				@endforeach
			@else
				<p class="center">Tidak ada band ditemukan.</p>
			@endif
		@endif
        </div>
    </div>
</div>
@endsection