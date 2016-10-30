@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading">List Musisi</div>
                <div class="panel-body">
                    @foreach($allmusisi as $musisi)
						{{$musisi->name}}
						<br/>
					@endforeach
                </div>
            </div>
        </div>
    </div>
</div>
@endsection