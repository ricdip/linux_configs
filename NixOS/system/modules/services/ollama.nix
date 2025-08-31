{
  services.ollama = {
    enable = true;
    # what interface to use for hardware acceleration
    # acceleration = "cuda";
    # download these models as soon as ollama.service has started (systemd unit ollama-model-loader.service)
    loadModels = [
      "dolphin-llama3:8b" # model with variety of instruction, conversational, and coding skills
      "gnokit/improve-prompt:latest" # model that improves user prompt for text-to-image generation
      "llava:7b" # model for general-purpose visual and language understanding
    ];
  };
}
