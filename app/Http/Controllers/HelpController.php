<?php

namespace App\Http\Controllers;

use Illuminate\Contracts\View\View;

class HelpController extends Controller
{
  public function show(): View
  {
    $user = auth()->user();
    return view('user.helper.help', ['user' => $user]);
  }

  public function navigation(): View
  {
    $user = auth()->user();
    return view('user.helper.navigation', ['user' => $user]);
  }

  public function create()
  {
    $user = auth()->user();
    return view('user.helper.create', ['user' => $user]);
  }
}
