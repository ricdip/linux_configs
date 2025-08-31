{
  services.ollama = {
    enable = true;
    loadModels = [
      "dolphin-llama3:8b" # model with variety of instruction, conversational, and coding skills
      "gnokit/improve-prompt:latest" # model that improves user prompt for text-to-image generation
      "llava:7b" # model for general-purpose visual and language understanding
    ];
  };
}
