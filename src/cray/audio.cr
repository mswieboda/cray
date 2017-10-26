require "./structs"

lib LibRay
  # audio device management functions
  fun init_audio_device = InitAudioDevice : Void
  fun close_audio_device = CloseAudioDevice : Void
  fun audio_device_ready? = IsAudioDeviceReady : Bool
  fun set_master_volume = SetMasterVolume(volume : LibC::Float) : Void

  # wave/sound loading/unloading functions
  fun load_wave = LoadWave(filename : LibC::Char*) : Wave
  fun load_wave_ex = LoadWaveEx(data : LibC::Float*, sample_count : LibC::Int, sample_rate : LibC::Int, sample_size : LibC::Int, channels : LibC::Int) # load wave data from float array data (32 bit)
  fun load_sound = LoadSound(filename : LibC::Char*) : Sound
  fun load_sound_ex = LoadSoundFromWave(wave : Wave) : Sound
  fun update_sound = UpdateSound(sound : Sound, data : Void*, num_samples : LibC::Int) # update sound buffer with new data
  fun unload_wave = UnloadWave(wave : Wave) : Void
  fun unload_sound = UnloadSound(sound : Sound) : Void

  # wave/sound management functions
  fun play_sound = PlaySound(sound : Sound) : Void
  fun pause_sound = PauseSound(sound : Sound) : Void
  fun resume_sound = ResumeSound(sound : Sound) : Void
  fun stop_sound = StopSound(sound : Sound) : Void
  fun sound_playing? = IsSoundPlaying(sound : Sound) : Bool
  fun set_sound_volume = SetSoundVolume(sound : Sound, volume : LibC::Float) : Void
  fun set_sound_pitch = SetSoundPitch(sound : Sound, pitch : LibC::Float) : Void
  fun wave_format = WaveFormat(wave : Wave*, sample_rate : LibC::Int, sample_size : LibC::Int, channels : LibC::Int) : Void
  fun wave_copy = WaveCopy(wave : Wave) : Wave
  fun wave_crop = WaveCrop(wave : Wave*, init_sample : LibC::Int, final_sample : LibC::Int) : Void # crop a wave to defined samples range
  fun get_wave_data = GetWaveData(wave : Wave) : LibC::Float*

  # music management functions
  fun load_music_stream = LoadMusicStream(filename : LibC::Char*) : Music
  fun unload_music_stream = UnloadMusicStream(music : Music) : Void
  fun play_music_stream = PlayMusicStream(music : Music) : Void
  fun update_music_stream = UpdateMusicStream(music : Music) : Void # updates buffer for music streaming
  fun stop_music_stream = StopMusicStream(music : Music) : Void
  fun pause_music_stream = PauseMusicStream(music : Music) : Void
  fun resume_music_stream = ResumeMusicStream(music : Music) : Void
  fun music_playing? = IsMusicPlaying(music : Music) : Bool
  fun set_music_volume = SetMusicVolume(music : Music, volume : LibC::Float) : Void
  fun set_music_pitch = SetMusicPitch(music : Music, pitch : LibC::Float) : Void
  fun set_music_loop_count = SetMusicLoopCount(music : Music, count : LibC::Float) : Void
  fun get_music_time_length = GetMusicTimeLength(music : Music) : LibC::Float
  fun get_music_time_played = GetMusicTimePlayed(music : Music) : LibC::Float

  # audiostream management functions
  fun init_audio_stream = InitAudioStream(sample_rate : LibC::UInt, sample_size : LibC::UInt, channels : LibC::UInt) : AudioStream
  fun update_audio_stream = UpdateAudioStream(stream : AudioStream, data : Void*, num_samples : LibC::Int) : Void
  fun close_audio_stream = CloseAudioStream(stream : AudioStream) : Void
  fun audio_buffer_processed? = IsAudioBufferProcessed(stream : AudioStream) : Bool
  fun play_audio_stream = PlayAudioStream(stream : AudioStream) : Void
  fun pause_audio_stream = PauseAudioStream(stream : AudioStream) : Void
  fun resume_audio_stream = ResumeAudioStream(stream : AudioStream) : Void
  fun stop_audio_stream = StopAudioStream(stream : AudioStream) : Void
end
