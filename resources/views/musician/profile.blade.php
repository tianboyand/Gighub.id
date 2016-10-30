@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row">
        <div class="col-md-10 col-md-offset-1">
            <div class="panel panel-default">
                <div class="panel-heading">nama musisi: {{ $musisi->name }}
                @if(Auth::guard('musician')->user()) 
                    @if(Auth::guard('musician')->user()->id == $musisi->id)
                        <a href={{ url('/') }}>edit</a>
                    @endif
                @endif
                <p>
                <?php 
                    for($i=0;$i<$review;$i++)
                        echo "<i class='fa fa-star'></i>";
                ?>
                </p>
                </div>

                <div class="panel-body">                   
                    @if(!Auth::guard('musician')->user())
                       This is {{$musisi->name}} Profile page
                    @else
                        @if(Auth::guard('musician')->user()->id == $musisi->id)
                            Your Profile Musician's Page
                        @else
                            This is {{$musisi->name}} Profile page
                        @endif
                    @endif
                    
                    @if(Auth::guard('user')->user())
                        <a href={{url('sewa-musisi/'.$musisi->slug)}} class="btn btn-info" role="button">SEWA</a>
                    @endif
                </div>
            </div>
        </div>
    </div>
</div>
@endsection