<?php

namespace App\Http\Controllers;

use App\Models\Manga;
use Exception;
use Illuminate\Contracts\View\View;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;

class MangaController extends Controller
{

  public static function index(): mixed
  {
    $manga = Manga::all();

    return $manga;
  }

  public function show(): View
  {
    $id = request('id');
    $manga = Manga::where('id', '=', $id);
    return view('manga.index', ['manga' => $manga]);
  }

  public function create(): View
  {
    $user = auth()->user();
    return view('user.create.manga.index', ['user' => $user]);
  }

  public function store(Request $request)
  {
    $manga = new Manga;

    $user = auth()->user();

    $manga->user_id = $user->id;
    $manga->name = $request->name;
    $manga->categorys = json_encode($request->categorys);
    $manga->synopsis = $request->synopsis;
    $manga->created_at = Carbon::now();
    $manga->updated_at = Carbon::now();

    if ($request->hasFile('image') && $request->file('image')->isValid()) {
      $requestImage = $request->image;
      $extension = $requestImage->extension();
      $imageName = md5($requestImage->getClientOriginalName() . strtotime('now')) . '.' . $extension;
      $requestImage->move(public_path('images/manga'), $imageName);
      $manga->image = $imageName;
    }

    $manga->qtd_chapter = 0;

    try {
      $manga->save();
    } catch (\Exception $e) {
      return redirect('/create/manga')->with('error', $e->getMessage());
    }

    return redirect('/')->with('msg', 'Mangá inserido com sucesso!');
  }
}