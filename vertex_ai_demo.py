from google import genai
from google.genai import types

client = genai.Client(
    vertexai=True,
    project="ds553-2026",
    location="global",
    http_options=types.HttpOptions(api_version="v1"),
)

prompt = input("Enter your prompt: ").strip()

if prompt:
    response = client.models.generate_content(
        model="gemini-3.8-flash",
        contents=prompt,
        config=types.GenerateContentConfig(
            system_instruction=(
                "You are helping MLOPs students learn about cloud computing. "
            ),
            max_output_tokens=1024,
        ),
    )

    print("\nResponse:\n")
    print(response.text)

    if response.usage_metadata:
        print("\nToken usage:")
        print(response.usage_metadata)
