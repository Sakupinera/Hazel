#pragma once

#include "Hazel.h"

#include "ParticleSystem.h"

class Sandbox2D : public Hazel::Layer
{
public:
	Sandbox2D();
	virtual ~Sandbox2D() = default;

	virtual void OnAttach() override;
	virtual void OnDetach() override;

	void OnUpdate(Hazel::Timestep ts) override;
	virtual void OnImGuiRender() override;
	void OnEvent(Hazel::Event& e) override;
private:
	Hazel::OrthographicCameraController m_CameraController;

	// Temp
	Hazel::Ref<Hazel::VertexArray> m_SquareVA;
	Hazel::Ref<Hazel::Shader> m_FlatColorShader;

	Hazel::Ref<Hazel::Texture2D> m_CheckerboardTexture;
	Hazel::Ref<Hazel::Texture2D> m_SpriteSheet;
	Hazel::Ref<Hazel::SubTexture2D> m_SpiralSubTexture, m_NumberSubTexture;

	glm::vec4 m_SquareColor = { 0.2f, 0.3f, 0.8f, 1.0f };

	ParticleSystem m_ParticleSystem;
	ParticleProps m_Particle;

	uint32_t m_MapWidth, m_MapHeight;
	std::unordered_map<char, Hazel::Ref<Hazel::SubTexture2D>> s_TextureMap;
};