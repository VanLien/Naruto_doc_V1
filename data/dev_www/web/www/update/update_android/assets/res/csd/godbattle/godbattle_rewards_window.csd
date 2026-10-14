<GameFile>
  <PropertyGroup Name="godbattle_rewards_window" Type="Layer" ID="pjrz4182tl0a9cqwd7nh-boumegkvi35sfyx" Version="3.10.0.0" />
  <Content ctype="GameProjectContent">
    <Content>
      <Animation Duration="15" Speed="1.000000">
        <Timeline ActionTag="1880908881" Property="Position">
          <PointFrame FrameIndex="0" X="-400.000000" Y="640.000000">
            <EasingData Type="0" />
          </PointFrame>
          <PointFrame FrameIndex="12" X="400.000000" Y="640.000000">
            <EasingData Type="0" />
          </PointFrame>
          <PointFrame FrameIndex="15" X="360.000000" Y="640.000000">
            <EasingData Type="0" />
          </PointFrame>
        </Timeline>
        <Timeline ActionTag="1880908881" Property="Scale">
          <ScaleFrame FrameIndex="0" X="1.000000" Y="1.000000">
            <EasingData Type="0" />
          </ScaleFrame>
          <ScaleFrame FrameIndex="12" X="1.000000" Y="1.000000">
            <EasingData Type="0" />
          </ScaleFrame>
          <ScaleFrame FrameIndex="15" X="1.000000" Y="1.000000">
            <EasingData Type="0" />
          </ScaleFrame>
        </Timeline>
        <Timeline ActionTag="1880908881" Property="RotationSkew">
          <ScaleFrame FrameIndex="0" X="0.000000" Y="0.000000">
            <EasingData Type="0" />
          </ScaleFrame>
          <ScaleFrame FrameIndex="12" X="0.000000" Y="0.000000">
            <EasingData Type="0" />
          </ScaleFrame>
          <ScaleFrame FrameIndex="15" X="0.000000" Y="0.000000">
            <EasingData Type="0" />
          </ScaleFrame>
        </Timeline>
        <Timeline ActionTag="1880908881" Property="Alpha">
          <IntFrame FrameIndex="0" Value="0">
            <EasingData Type="0" />
          </IntFrame>
          <IntFrame FrameIndex="12" Value="255">
            <EasingData Type="0" />
          </IntFrame>
          <IntFrame FrameIndex="15" Value="255">
            <EasingData Type="0" />
          </IntFrame>
        </Timeline>
        <Timeline ActionTag="1880908881" Property="FrameEvent">
          <EventFrame FrameIndex="12" Value="">
          </EventFrame>
          <EventFrame FrameIndex="15" Value="start_frame">
          </EventFrame>
        </Timeline>
      </Animation>
      <ObjectData Name="root_wnd" ctype="GameNodeObjectData">
        <Size X="720.000000" Y="1280.000000" />
        <Children>
          <AbstractNodeData Name="background" ActionTag="-104679602" Tag="42" RotationSkewX="0" RotationSkewY="0" LeftMargin="0" RightMargin="0" TopMargin="0" BottomMargin="0" TouchEnable="True" ComboBoxIndex="1" BackColorAlpha="182" LeftEage="0" RightEage="0" TopEage="0" BottomEage="0" Scale9OriginX="0" Scale9OriginY="0" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
            <Size Y="1280" X="720" />
            <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
            <Position X="360" Y="640" />
            <Scale ScaleX="1" ScaleY="1" />
            <CColor A="255" B="255" G="255" R="255" />
            <FileData />
            <FirstColor A="255" B="255" G="200" R="150" />
            <EndColor A="255" B="255" G="255" R="255" />
            <ColorVector ScaleX="0" ScaleY="1" />
            <SingleColor A="255" B="0" G="0" R="0" />
          </AbstractNodeData>
          <AbstractNodeData Name="main_container" ActionTag="1880908881" Tag="23" RotationSkewX="0" RotationSkewY="0" LeftMargin="-738" RightMargin="782" TopMargin="206" BottomMargin="206" TouchEnable="True" Alpha="0" BackColorAlpha="75" Scale9Enable="True" LeftEage="-14" RightEage="-14" TopEage="-39" BottomEage="-39" Scale9OriginX="-14" Scale9OriginY="-39" Scale9Width="28" Scale9Height="78" ctype="PanelObjectData">
            <Size Y="868" X="676" />
            <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
            <Position X="-400" Y="640" />
            <Scale ScaleX="1" ScaleY="1" />
            <CColor A="255" B="255" G="255" R="255" />
            <FileData />
            <FirstColor A="255" B="255" G="200" R="150" />
            <EndColor A="255" B="255" G="255" R="255" />
            <ColorVector ScaleX="0" ScaleY="1" />
            <SingleColor A="255" B="0" G="0" R="0" />
            <Children>
              <AbstractNodeData Name="main_panel" ActionTag="-872551169" Tag="24" RotationSkewX="0" RotationSkewY="0" LeftMargin="0.5008" RightMargin="-0.5008" TopMargin="-24.59" BottomMargin="24.59" TouchEnable="True" BackColorAlpha="102" Scale9Enable="True" LeftEage="20" RightEage="20" TopEage="20" BottomEage="20" Scale9OriginX="20" Scale9OriginY="20" Scale9Width="5" Scale9Height="8" ctype="PanelObjectData">
                <Size Y="868" X="676" />
                <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                <Position X="338.500793" Y="458.589996" />
                <Scale ScaleX="1" ScaleY="1" />
                <CColor A="255" B="255" G="255" R="255" />
                <FileData Type="PlistSubImage" Path="common_1036.png" Plist="resource/common/common.plist" />
                <FirstColor A="255" B="255" G="200" R="150" />
                <EndColor A="255" B="255" G="255" R="255" />
                <ColorVector ScaleX="0" ScaleY="1" />
                <SingleColor A="255" B="255" G="200" R="150" />
                <Children>
                  <AbstractNodeData Name="Image_1" ActionTag="-1728350256" Tag="25" RotationSkewX="0" RotationSkewY="0" LeftMargin="17" RightMargin="15" TopMargin="40.684799" BottomMargin="17.315201" LeftEage="14" RightEage="14" TopEage="14" BottomEage="14" Scale9OriginX="14" Scale9OriginY="14" Scale9Width="49" Scale9Height="46" Scale9Enable="True" ctype="ImageViewObjectData">
                    <Size Y="810" X="644" />
                    <AnchorPoint ScaleX="0" ScaleY="0" />
                    <Position X="17" Y="17.315201" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData Type="PlistSubImage" Path="common_1037.png" Plist="resource/common/common.plist" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="Image_2" ActionTag="-278055777" Tag="26" RotationSkewX="0" RotationSkewY="0" LeftMargin="207.5" RightMargin="207.5" TopMargin="-22.495399" BottomMargin="827.495422" LeftEage="59" RightEage="59" TopEage="0" BottomEage="0" Scale9OriginX="59" Scale9OriginY="0" Scale9Width="38" Scale9Height="63" Scale9Enable="True" ctype="ImageViewObjectData">
                    <Size Y="63" X="261" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="338" Y="858.995422" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData Type="PlistSubImage" Path="common_1024.png" Plist="resource/common/common.plist" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="close_btn" ActionTag="568877433" Tag="27" RotationSkewX="0" RotationSkewY="0" LeftMargin="629.500122" RightMargin="-12.5001" TopMargin="-14.5006" BottomMargin="811.50061" TouchEnable="True" LeftEage="19" RightEage="19" TopEage="23" BottomEage="23" Scale9OriginX="19" Scale9OriginY="23" Scale9Width="21" Scale9Height="25" ctype="ImageViewObjectData">
                    <Size Y="62" X="70" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="659.000122" Y="847.00061" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData Type="PlistSubImage" Path="common_1028.png" Plist="resource/common/common.plist" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="tab_container" ActionTag="620894515" Tag="194" RotationSkewX="0" RotationSkewY="0" LeftMargin="174" RightMargin="174" TopMargin="48.117699" BottomMargin="766.882324" BackColorAlpha="102" LeftEage="0" RightEage="0" TopEage="0" BottomEage="0" Scale9OriginX="0" Scale9OriginY="0" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                    <Size Y="53" X="328" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0" />
                    <Position X="338" Y="766.882324" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData />
                    <FirstColor A="255" B="255" G="200" R="150" />
                    <EndColor A="255" B="255" G="255" R="255" />
                    <ColorVector ScaleX="0" ScaleY="1" />
                    <SingleColor A="255" B="255" G="200" R="150" />
                    <Children>
                      <AbstractNodeData Name="Image_2" ActionTag="1950121778" Tag="195" RotationSkewX="0" RotationSkewY="0" LeftMargin="0" RightMargin="0" TopMargin="-0.5" BottomMargin="-0.5" LeftEage="7" RightEage="7" TopEage="16" BottomEage="16" Scale9OriginX="7" Scale9OriginY="16" Scale9Width="10" Scale9Height="22" Scale9Enable="True" ctype="ImageViewObjectData">
                        <Size Y="54" X="328" />
                        <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                        <Position X="164" Y="26.5" />
                        <Scale ScaleX="1" ScaleY="1" />
                        <CColor A="255" B="255" G="255" R="255" />
                        <FileData Type="PlistSubImage" Path="common_2020.png" Plist="resource/common/common.plist" />
                      </AbstractNodeData>
                      <AbstractNodeData Name="tab_btn_1" ActionTag="154753209" Tag="196" RotationSkewX="0" RotationSkewY="0" LeftMargin="5.5912" RightMargin="164.408798" TopMargin="1.5" BottomMargin="1.5" TouchEnable="True" Scale9Enable="True" LeftEage="5" RightEage="5" TopEage="11" BottomEage="11" Scale9OriginX="5" Scale9OriginY="11" Scale9Width="7" Scale9Height="28" ShadowOffsetX="2" ShadowOffsetY="-2" ButtonText="" FontSize="24" ctype="ButtonObjectData">
                        <Size Y="50" X="158" />
                        <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                        <Position X="84.591202" Y="26.5" />
                        <Scale ScaleX="-1" ScaleY="1" />
                        <CColor A="255" B="255" G="255" R="255" />
                        <NormalFileData Type="PlistSubImage" Path="common_2021.png" Plist="resource/common/common.plist" />
                        <PressedFileData Type="PlistSubImage" Path="common_2021.png" Plist="resource/common/common.plist" />
                        <DisabledFileData Type="PlistSubImage" Path="common_2023.png" Plist="resource/common/common.plist" />
                        <TextColor A="255" B="41" G="52" R="89" />
                        <OutlineColor A="255" B="0" G="0" R="255" />
                        <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                        <ShadowColor A="255" B="110" G="110" R="110" />
                        <Children>
                          <AbstractNodeData Name="title" ActionTag="1312481210" Tag="197" RotationSkewX="0" RotationSkewY="0" LeftMargin="41" RightMargin="41" TopMargin="10" BottomMargin="10" FontSize="24" LabelText="---" OutlineEnabled="True" OutlineSize="2" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                            <Size Y="30" X="76" />
                            <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                            <Position X="79" Y="25" />
                            <Scale ScaleX="-1" ScaleY="1" />
                            <CColor A="255" B="214" G="237" R="255" />
                            <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                            <OutlineColor A="255" B="14" G="22" R="42" />
                            <ShadowColor A="255" B="110" G="110" R="110" />
                          </AbstractNodeData>
                          <AbstractNodeData Name="tips" Visible="False" ActionTag="-827892326" Tag="198" RotationSkewX="0" RotationSkewY="0" LeftMargin="1.0276" RightMargin="121.972397" TopMargin="-13.0397" BottomMargin="28.0397" LeftEage="11" RightEage="11" TopEage="16" BottomEage="16" Scale9OriginX="11" Scale9OriginY="16" Scale9Width="13" Scale9Height="3" Scale9Enable="True" ctype="ImageViewObjectData">
                            <Size Y="35" X="35" />
                            <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                            <Position X="18.527599" Y="45.5397" />
                            <Scale ScaleX="1" ScaleY="1" />
                            <CColor A="255" B="255" G="255" R="255" />
                            <FileData Type="PlistSubImage" Path="common_1014.png" Plist="resource/common/common.plist" />
                          </AbstractNodeData>
                        </Children>
                      </AbstractNodeData>
                      <AbstractNodeData Name="tab_btn_2" ActionTag="-2039430050" Tag="199" RotationSkewX="0" RotationSkewY="0" LeftMargin="164.277603" RightMargin="5.7224" TopMargin="1.5" BottomMargin="1.5" TouchEnable="True" Scale9Enable="True" LeftEage="5" RightEage="5" TopEage="11" BottomEage="11" Scale9OriginX="5" Scale9OriginY="11" Scale9Width="7" Scale9Height="28" ShadowOffsetX="2" ShadowOffsetY="-2" ButtonText="" FontSize="24" ctype="ButtonObjectData">
                        <Size Y="50" X="158" />
                        <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                        <Position X="243.277603" Y="26.5" />
                        <Scale ScaleX="1" ScaleY="1" />
                        <CColor A="255" B="255" G="255" R="255" />
                        <NormalFileData Type="PlistSubImage" Path="common_2021.png" Plist="resource/common/common.plist" />
                        <PressedFileData Type="PlistSubImage" Path="common_2021.png" Plist="resource/common/common.plist" />
                        <DisabledFileData Type="PlistSubImage" Path="common_2023.png" Plist="resource/common/common.plist" />
                        <TextColor A="255" B="41" G="52" R="89" />
                        <OutlineColor A="255" B="0" G="0" R="255" />
                        <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                        <ShadowColor A="255" B="110" G="110" R="110" />
                        <Children>
                          <AbstractNodeData Name="title" ActionTag="-529017259" Tag="200" RotationSkewX="0" RotationSkewY="0" LeftMargin="41" RightMargin="41" TopMargin="10" BottomMargin="10" FontSize="24" LabelText="---" OutlineEnabled="True" OutlineSize="2" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                            <Size Y="30" X="76" />
                            <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                            <Position X="79" Y="25" />
                            <Scale ScaleX="1" ScaleY="1" />
                            <CColor A="255" B="214" G="237" R="255" />
                            <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                            <OutlineColor A="255" B="14" G="22" R="42" />
                            <ShadowColor A="255" B="110" G="110" R="110" />
                          </AbstractNodeData>
                          <AbstractNodeData Name="tips" Visible="False" ActionTag="1794446710" Tag="201" RotationSkewX="0" RotationSkewY="0" LeftMargin="91.652199" RightMargin="31.347799" TopMargin="-13.0399" BottomMargin="28.0399" LeftEage="11" RightEage="11" TopEage="16" BottomEage="16" Scale9OriginX="11" Scale9OriginY="16" Scale9Width="13" Scale9Height="3" Scale9Enable="True" ctype="ImageViewObjectData">
                            <Size Y="35" X="35" />
                            <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                            <Position X="109.152199" Y="45.539902" />
                            <Scale ScaleX="1" ScaleY="1" />
                            <CColor A="255" B="255" G="255" R="255" />
                            <FileData Type="PlistSubImage" Path="common_1014.png" Plist="resource/common/common.plist" />
                          </AbstractNodeData>
                        </Children>
                      </AbstractNodeData>
                    </Children>
                  </AbstractNodeData>
                  <AbstractNodeData Name="win_title" ActionTag="1885790766" Tag="40" RotationSkewX="0" RotationSkewY="0" LeftMargin="276" RightMargin="276" TopMargin="-11.0023" BottomMargin="843.002319" FontSize="30" LabelText="---" OutlineEnabled="True" OutlineSize="2" ShadowOffsetX="2" ShadowOffsetY="-2" ctype="TextObjectData">
                    <Size Y="36" X="124" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0.5" />
                    <Position X="338" Y="861.002319" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="205" G="234" R="250" />
                    <FontResource Type="Normal" Path="fonts/mini.ttf" Plist="" />
                    <OutlineColor A="255" B="15" G="26" R="38" />
                    <ShadowColor A="255" B="110" G="110" R="110" />
                  </AbstractNodeData>
                  <AbstractNodeData Name="container" ActionTag="-1353638315" Tag="41" RotationSkewX="0" RotationSkewY="0" LeftMargin="26" RightMargin="26" TopMargin="108" BottomMargin="28" TouchEnable="True" LeftEage="0" RightEage="0" TopEage="0" BottomEage="0" Scale9OriginX="0" Scale9OriginY="0" Scale9Width="1" Scale9Height="1" ctype="PanelObjectData">
                    <Size Y="732" X="624" />
                    <AnchorPoint ScaleX="0.5" ScaleY="0" />
                    <Position X="338" Y="28" />
                    <Scale ScaleX="1" ScaleY="1" />
                    <CColor A="255" B="255" G="255" R="255" />
                    <FileData />
                    <FirstColor A="255" B="255" G="200" R="150" />
                    <EndColor A="255" B="255" G="255" R="255" />
                    <ColorVector ScaleX="0" ScaleY="1" />
                    <SingleColor A="255" B="0" G="0" R="0" />
                  </AbstractNodeData>
                </Children>
              </AbstractNodeData>
            </Children>
          </AbstractNodeData>
        </Children>
      </ObjectData>
    </Content>
  </Content>
</GameFile>
