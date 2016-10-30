@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-md-offset-3">
                <div class="row">
                    <div class="col-md-6 col-md-offset-3">
                        <div>
                            <ul class="nav nav-tabs">
                                <li class="active"><a href="#tab-1" role="tab" data-toggle="tab">Musisi </a></li>
                                <li><a href="#tab-2" role="tab" data-toggle="tab">Organizer </a></li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane active" role="tabpanel" id="tab-1">
                                    <form class="form-horizontal" role="form" method="POST" action="{{ url('/musician/register') }}">
                                    {{ csrf_field() }}
                                        <h4 class="text-center">Daftar sebagai Musisi</h4>
                                         <div class="form-group{{ $errors->has('name') ? ' has-error' : '' }}" id='register-name' >
                                            <label class="col-md-4 control-label">Name</label>

                                            <div class="col-md-6">
                                                <input type="text" class="form-control" name="name" value="{{ old('name') }}">

                                                @if ($errors->has('name'))
                                                    <span class="help-block">
                                                        <strong>{{ $errors->first('name') }}</strong>
                                                    </span>
                                                @endif
                                            </div>
                                        </div>
                                        <div class="form-group{{ $errors->has('email') ? ' has-error' : '' }}">
                                            <label class="col-md-4 control-label">E-Mail Address</label>

                                            <div class="col-md-6">
                                                <input type="email" class="form-control" name="email" value="{{ old('email') }}">

                                                @if ($errors->has('email'))
                                                    <span class="help-block">
                                                        <strong>{{ $errors->first('email') }}</strong>
                                                    </span>
                                                @endif
                                            </div>
                                        </div>

                                        <div class="form-group{{ $errors->has('password') ? ' has-error' : '' }}">
                                            <label class="col-md-4 control-label">Password</label>

                                            <div class="col-md-6">
                                                <input type="password" class="form-control" name="password">

                                                @if ($errors->has('password'))
                                                    <span class="help-block">
                                                        <strong>{{ $errors->first('password') }}</strong>
                                                    </span>
                                                @endif
                                            </div>
                                        </div>

                                        <div class="form-group{{ $errors->has('password_confirmation') ? ' has-error' : '' }}">
                                            <label class="col-md-4 control-label">Confirm Password</label>

                                            <div class="col-md-6">
                                                <input type="password" class="form-control" name="password_confirmation">

                                                @if ($errors->has('password_confirmation'))
                                                    <span class="help-block">
                                                        <strong>{{ $errors->first('password_confirmation') }}</strong>
                                                    </span>
                                                @endif
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <button class="btn btn-primary" type="submit">Register </button>
                                        </div>
                                    </form>
                                </div>
                                <div class="tab-pane" role="tabpanel" id="tab-2">
                                    <form class="form-horizontal" role="form" method="POST" action="{{ url('/register') }}">
                                    {{ csrf_field() }}
                                        <h4 class="text-center">Daftar sebagai Organizer</h4>
                                        <div class="form-group{{ $errors->has('first_name') ? ' has-error' : '' }}" id='register-first-name'>
                                            <label class="col-md-4 control-label">First Name</label>

                                            <div class="col-md-6">
                                                <input type="text" class="form-control" name="first_name" value="{{ old('first_name') }}">

                                                @if ($errors->has('first_name'))
                                                    <span class="help-block">
                                                        <strong>{{ $errors->first('first_name') }}</strong>
                                                    </span>
                                                @endif
                                            </div>
                                        </div>
                                        <div class="form-group{{ $errors->has('last_name') ? ' has-error' : '' }}" id='register-last-name'>
                                            <label class="col-md-4 control-label">Last Name</label>

                                            <div class="col-md-6">
                                                <input type="text" class="form-control" name="last_name" value="{{ old('last_name') }}">

                                                @if ($errors->has('last_name'))
                                                    <span class="help-block">
                                                        <strong>{{ $errors->first('last_name') }}</strong>
                                                    </span>
                                                @endif
                                            </div>
                                        </div>
                                         <div class="form-group{{ $errors->has('name') ? ' has-error' : '' }}" id='register-name' style="display:none">
                                            <label class="col-md-4 control-label">Name</label>

                                            <div class="col-md-6">
                                                <input type="text" class="form-control" name="name" value="{{ old('name') }}">

                                                @if ($errors->has('name'))
                                                    <span class="help-block">
                                                        <strong>{{ $errors->first('name') }}</strong>
                                                    </span>
                                                @endif
                                            </div>
                                        </div>
                                        <div class="form-group{{ $errors->has('email') ? ' has-error' : '' }}">
                                            <label class="col-md-4 control-label">E-Mail Address</label>

                                            <div class="col-md-6">
                                                <input type="email" class="form-control" name="email" value="{{ old('email') }}">

                                                @if ($errors->has('email'))
                                                    <span class="help-block">
                                                        <strong>{{ $errors->first('email') }}</strong>
                                                    </span>
                                                @endif
                                            </div>
                                        </div>

                                        <div class="form-group{{ $errors->has('password') ? ' has-error' : '' }}">
                                            <label class="col-md-4 control-label">Password</label>

                                            <div class="col-md-6">
                                                <input type="password" class="form-control" name="password">

                                                @if ($errors->has('password'))
                                                    <span class="help-block">
                                                        <strong>{{ $errors->first('password') }}</strong>
                                                    </span>
                                                @endif
                                            </div>
                                        </div>

                                        <div class="form-group{{ $errors->has('password_confirmation') ? ' has-error' : '' }}">
                                            <label class="col-md-4 control-label">Confirm Password</label>

                                            <div class="col-md-6">
                                                <input type="password" class="form-control" name="password_confirmation">

                                                @if ($errors->has('password_confirmation'))
                                                    <span class="help-block">
                                                        <strong>{{ $errors->first('password_confirmation') }}</strong>
                                                    </span>
                                                @endif
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <button class="btn btn-primary" type="submit">Register </button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
