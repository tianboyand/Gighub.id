<?php

namespace App;

use Illuminate\Foundation\Auth\User as Authenticatable;
use Cviebrock\EloquentSluggable\Sluggable;

class User extends Authenticatable
{

    protected $table = 'users';

    use Sluggable;

    public function sluggable()
    {
        return [
            'slug' => [
                'source' => 'first_name'
            ]
        ];
    }

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'id','first_name','last_name', 'email', 'photo', 'password', 'aktif'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'id','password', 'remember_token',
    ];
}
