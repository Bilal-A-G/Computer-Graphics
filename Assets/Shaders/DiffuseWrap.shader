Shader "Custom/DiffuseWrap"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }

        CGPROGRAM
        #pragma surface surf DiffuseWrap

        float4 LightingDiffuseWrap(SurfaceOutput s, fixed3 lightDirection, fixed attenuation)
        {
            float diffuseStrength = dot(s.Normal, normalize(lightDirection));
            diffuseStrength = diffuseStrength * 0.5 + 0.5;
            float3 colour = s.Albedo * _LightColor0.rgb * diffuseStrength;
            return float4(colour.rgb, 0);
        }
        
        struct Input
        {
            float2 uv_MainTex;
        };

        fixed4 _Color;

        void surf (Input IN, inout SurfaceOutput o)
        {
            o.Albedo = _Color.rgb;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
