Rails.application.config.middleware.use OmniAuth::Builder do
    provider :google_oauth2, "433245101870-b5pekkelu2jp66jcej9dag1m82vpr2nc.apps.googleusercontent.com", "4rrQjpIlv9prgxrL4p9E7nhM"
    provider :facebook, "544375235910385", "0bec76216c6199a17647d35ecd593357"
end