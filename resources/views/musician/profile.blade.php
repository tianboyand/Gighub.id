<?php
    header('X-Frame-Options: GOFORIT'); 
?>
@extends('layouts.app')

@section('content')
<div class="container">
@if (Session::has('message'))
    <div class="alert alert-info">{{ Session::get('message') }}</div>
@endif
    <div class="row">
        <div class="col-md-10 col-md-offset-1">
             <div class="panel panel-default">
            <div class="panel-body">
                <div class="media">
                    <div class="media-left">
                            <img src={!! Cloudder::show($musisi->photo , ['format' => 'jpg', 'crop' => 'fit', 'width' => '500', 'height'=> '315']) !!} alt="Logo" class="widthfull">                                                
                    </div>

                    
                    <div class="media-body">
                        <div class="media-right">
                        <div class="media-body">
                                    {!! Embed::make($musisi->youtube_video)->parseUrl()->getIframe() !!}
                        </div>
                    </div>                                      
                    </div>
                </div>
                <hr> 
                <section>
                    <h1 class="text-center">{{$musisi->name}}</h1>
                    @if(Auth::guard('musician')->user()) 
                        @if(Auth::guard('musician')->user()->id == $musisi->id)
                         <div class="row">
                            <div class="col-md-6 col-md-offset-3">
                            <a class="btn btn-black btn-block" href={{ url('/') }}>Edit</a>
                        </div>
                        </div>
                    @endif
                    @endif

                    <p class="text-center">Harga Sewa / Jam : Rp. {{$musisi->harga_sewa }}</p>

                    @if(Auth::guard('user')->user())   
                        <div class="row">
                            <div class="col-md-6 col-md-offset-3">
                                <span><a href={{url('sewa-musisi/'.$musisi->slug)}} class="btn btn-black btn-block" role="button">SEWA</a></span>
                            </div>
                        </div>                                            
                                
                    @endif
                        @if(Auth::guard('user')->user())
                    @elseif(Auth::guard('musician')->user())
                    @else                            
                         <div class="row">
                            <div class="col-md-6 col-md-offset-3">
                                <span><a href={{url('sewa-musisi/'.$musisi->slug)}} class="btn btn-black btn-block" role="button">SEWA</a></span>
                            </div>
                        </div>
                    @endif
                    <p class="text-center">Reviews :
                        <?php 
                            for($i=0;$i<$review;$i++)
                                echo "<i class='fa fa-star'></i>";
                        ?>
                        <a href={{ url('detail-review/'.$musisi->slug) }}>( {{$totalrev}} )</a>
                    </p>
                    <p>Tipe : {{$musisi->tipe}}</p>
                    <p>Basis : {{$musisi->basis}}</p>
                     <p>Kota : {{$musisi->kota}}</p>
                    <p>Genre : Pop | Jazz</p>
                    <p>Deskripsi : {{$musisi->deskripsi}}</p>                    
                </section>
            </div>            
        </div>    
        </div>
    </div>
</div>
@endsection