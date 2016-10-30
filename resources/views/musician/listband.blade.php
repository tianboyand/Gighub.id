@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-10 col-md-offset-1">
		@if(!$listband->isEmpty())	
			@foreach($listband as $_listband)
				<div class="panel panel-default">
					<div class="panel-heading"><a href={{ url('/band/'.$_listband->slug) }}>{{$_listband->nama_grupband}}</a>
					@if($_listband->admin_id == Auth::guard('musician')->user()->id)
						| <a href={{ url('/edit-band/'.$_listband->slug) }}>edit</a>
					@endif
					</div>
					<div class="panel-body">
						{{$_listband->deskripsi}}
					</div>
				</div>
			@endforeach
		@else
			<p class="center">Anda belum memiliki band</p>
		@endif
        </div>
    </div>
</div>
@endsection